import pytest
from sqlalchemy import text

from src.database import engine, get_mongo_collection
from src.models import Base


@pytest.fixture(scope="session", autouse=True)
async def setup_db():
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)
    yield


@pytest.fixture(autouse=True)
async def clean_db():
    yield
    try:
        async with engine.begin() as conn:
            await conn.execute(text("DELETE FROM users"))
    except Exception:
        pass

    try:
        col = get_mongo_collection("items")
        await col.delete_many({})
    except Exception:
        pass

