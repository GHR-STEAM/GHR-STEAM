from motor.motor_asyncio import AsyncIOMotorClient
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import sessionmaker
from src.core.config import settings

mongo_client = AsyncIOMotorClient(settings.mongo_uri)
mongo_db = mongo_client.get_default_database()

engine = create_async_engine(settings.postgres_url, echo=False, pool_size=5, max_overflow=10)
AsyncSessionLocal = sessionmaker(engine, class_=AsyncSession, expire_on_commit=False)


async def get_pg_session():
    async with AsyncSessionLocal() as session:
        yield session


def get_mongo_collection(name: str):
    return mongo_db[name]
