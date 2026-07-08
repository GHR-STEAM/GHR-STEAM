from pydantic import BaseModel
from typing import Any
from datetime import datetime


class ItemCreate(BaseModel):
    name: str
    description: str | None = None
    tags: list[str] = []


class ItemOut(BaseModel):
    id: str
    name: str
    description: str | None
    tags: list[str]
    created_at: datetime | None

    class Config:
        from_attributes = True


class HeavyReportOut(BaseModel):
    total_users: int
    total_items: int
    cache_hits: int
