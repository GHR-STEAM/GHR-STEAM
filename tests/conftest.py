import pytest
import asyncio
from sqlalchemy import text
from src.database import engine


@pytest.fixture(scope="session")
def event_loop():
    loop = asyncio.new_event_loop()
    yield loop
    loop.close()


@pytest.fixture(autouse=True)
async def clean_db():
    yield
    async with engine.begin() as conn:
        await conn.execute(text("DELETE FROM users"))
