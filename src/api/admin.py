from fastapi import APIRouter, Depends
from sqlalchemy import func, select
from sqlalchemy.ext.asyncio import AsyncSession

from src.api.deps import get_current_user
from src.cache import get_redis_sync
from src.database import get_mongo_collection, get_pg_session
from src.models import User

router = APIRouter(prefix="/admin", tags=["admin"])


@router.get("/stats")
async def stats(
    db: AsyncSession = Depends(get_pg_session),
    _=Depends(get_current_user),
):
    result = await db.execute(select(func.count(User.id)))
    total_users = result.scalar() or 0

    mongo_col = get_mongo_collection("items")
    total_items = await mongo_col.count_documents({})

    r = get_redis_sync()
    redis_info = {}
    if r:
        info = r.info()
        redis_info = {
            "used_memory_human": info.get("used_memory_human", "N/A"),
            "total_connections_received": info.get("total_connections_received", 0),
            "keyspace_hits": info.get("keyspace_hits", 0),
            "keyspace_misses": info.get("keyspace_misses", 0),
        }

    return {
        "total_users": total_users,
        "total_items": total_items,
        "redis": redis_info,
    }


@router.get("/health/full")
async def full_health(
    db: AsyncSession = Depends(get_pg_session),
    _=Depends(get_current_user),
):
    checks = {}

    try:
        mongo_col = get_mongo_collection("items")
        await mongo_col.find_one()
        checks["mongo"] = "ok"
    except Exception as e:
        checks["mongo"] = f"error: {e}"

    r = get_redis_sync()
    try:
        if r:
            r.ping()
            checks["redis"] = "ok"
        else:
            checks["redis"] = "disabled"
    except Exception as e:
        checks["redis"] = f"error: {e}"

    try:
        await db.execute(select(func.count(User.id)))
        checks["postgres"] = "ok"
    except Exception as e:
        checks["postgres"] = f"error: {e}"

    return {"status": "ok" if all(v == "ok" for v in checks.values()) else "degraded", "checks": checks}
