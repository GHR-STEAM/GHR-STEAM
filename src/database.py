import os
from pymongo import MongoClient

MONGO_URI = os.getenv("MONGO_URI", "mongodb://127.0.0.1:27017/testdb")

client: MongoClient | None = None


def get_client() -> MongoClient:
    global client
    if client is None:
        client = MongoClient(MONGO_URI)
    return client


def get_db():
    return get_client().get_default_database()
