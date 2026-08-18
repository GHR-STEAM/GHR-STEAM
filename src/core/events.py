import json
from typing import Any

from src.cache import get_redis_sync

STREAM_KEY = "events:stream"
GROUP_NAME = "workers"
CONSUMER_NAME = "api-instance-1"


def emit_event(event_type: str, data: dict[str, Any]) -> bool:
    r = get_redis_sync()
    if r is None:
        return False
    payload = json.dumps({"type": event_type, "data": data}, default=str)
    r.xadd(STREAM_KEY, {"payload": payload})
    return True


def ensure_group():
    r = get_redis_sync()
    if r is None:
        return
    try:
        r.xgroup_create(STREAM_KEY, GROUP_NAME, id="0", mkstream=True)
    except Exception:
        pass


def consume_events(count: int = 10, block_ms: int = 2000) -> list[dict]:
    r = get_redis_sync()
    if r is None:
        return []
    results = r.xreadgroup(GROUP_NAME, CONSUMER_NAME, {STREAM_KEY: ">"}, count=count, block=block_ms)
    messages = []
    for stream, entries in results:
        for msg_id, fields in entries:
            try:
                messages.append(json.loads(fields[b"payload"].decode()))
            except Exception:
                pass
            r.xack(STREAM_KEY, GROUP_NAME, msg_id)
    return messages
