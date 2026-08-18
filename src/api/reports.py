from fastapi import APIRouter, Depends
from sqlalchemy import func, select
from sqlalchemy.ext.asyncio import AsyncSession

from src.api.deps import get_current_user
from src.cache import get_redis_sync
from src.core.logging import logger
from src.database import get_mongo_collection, get_pg_session
from src.models import User
from src.schemas.item import HeavyReportOut

router = APIRouter(prefix="/reports", tags=["reports"])


@router.get("/heavy", response_model=HeavyReportOut)
async def heavy_report(
    user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_pg_session),
):
    result = await db.execute(select(func.count(User.id)))
    total_users = result.scalar() or 0

    col = get_mongo_collection("items")
    total_items = await col.count_documents({})

    r = get_redis_sync()
    cache_hits = 0
    if r:
        info = r.info("stats")
        cache_hits = info.get("keyspace_hits", 0)

    logger.info("heavy report generated", total_users=total_users, total_items=total_items)
    return HeavyReportOut(total_users=total_users, total_items=total_items, cache_hits=cache_hits)
