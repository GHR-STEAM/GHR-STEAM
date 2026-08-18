import redis
import redis.asyncio as aioredis

from src.core.config import settings

_redis_sync: redis.Redis | None = None
_redis_async: aioredis.Redis | None = None

if settings.redis_enabled:
    _redis_sync = redis.Redis.from_url(settings.redis_url, decode_responses=True)


def get_redis_sync() -> redis.Redis | None:
    return _redis_sync


async def get_redis_async() -> aioredis.Redis | None:
    global _redis_async
    if not settings.redis_enabled:
        return None
    if _redis_async is None:
        _redis_async = aioredis.from_url(settings.redis_url, decode_responses=True)
    return _redis_async


async def close_redis():
    global _redis_async
    if _redis_async:
        await _redis_async.close()
        _redis_async = None
