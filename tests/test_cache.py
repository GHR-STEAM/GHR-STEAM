import pytest
from src.cache import get_redis, close_redis


@pytest.mark.asyncio
async def test_redis_ping():
    r = await get_redis()
    if r is None:
        pytest.skip("REDIS_ENABLED is not set")
    pong = await r.ping()
    assert pong is True


@pytest.mark.asyncio
async def test_redis_set_get():
    r = await get_redis()
    if r is None:
        pytest.skip("REDIS_ENABLED is not set")
    await r.set("test_key", "test_value")
    val = await r.get("test_key")
    assert val == "test_value"
    await r.delete("test_key")
