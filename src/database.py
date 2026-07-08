import os
from motor.motor_asyncio import AsyncIOMotorClient
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import sessionmaker

MONGO_URI = os.getenv("MONGO_URI", "mongodb://127.0.0.1:27017/testdb")
client = AsyncIOMotorClient(MONGO_URI)
mongo_db = client.get_default_database()

POSTGRES_URL = os.getenv("POSTGRES_URL", "postgresql+asyncpg://postgres:postgres@127.0.0.1:5432/testdb")
engine = create_async_engine(POSTGRES_URL, echo=False)
AsyncSessionLocal = sessionmaker(engine, class_=AsyncSession, expire_on_commit=False)

def get_db():
    return AsyncSessionLocal()
