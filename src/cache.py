import os
import redis

REDIS_URL = os.getenv("REDIS_URL", "redis://127.0.0.1:6379")
REDIS_ENABLED = os.getenv("REDIS_ENABLED", "true").lower() == "true"

redis_client = None
if REDIS_ENABLED:
    redis_client = redis.Redis.from_url(REDIS_URL)

def get_redis():
    return redis_client
