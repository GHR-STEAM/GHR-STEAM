from motor.motor_asyncio import AsyncIOMotorClient
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.pool import NullPool

from src.core.config import settings

engine = create_async_engine(settings.postgres_url, echo=False, poolclass=NullPool)
AsyncSessionLocal = sessionmaker(engine, class_=AsyncSession, expire_on_commit=False)


async def get_pg_session():
    async with AsyncSessionLocal() as session:
        yield session


def get_mongo_collection(name: str):
    client = AsyncIOMotorClient(settings.mongo_uri)
    return client.get_default_database()[name]
