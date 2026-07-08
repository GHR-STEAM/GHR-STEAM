import os
import redis.asyncio as aioredis

REDIS_URL = os.getenv("REDIS_URL", "redis://127.0.0.1:6379")
REDIS_ENABLED = os.getenv("REDIS_ENABLED", "false").lower() == "true"

redis_client: aioredis.Redis | None = None


async def get_redis() -> aioredis.Redis | None:
    global redis_client
    if not REDIS_ENABLED:
        return None
    if redis_client is None:
        redis_client = aioredis.from_url(REDIS_URL, decode_responses=True)
    return redis_client


async def close_redis():
    global redis_client
    if redis_client:
        await redis_client.close()
        redis_client = None
