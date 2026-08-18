from datetime import datetime

from pydantic import BaseModel, ConfigDict


class ItemCreate(BaseModel):
    name: str
    description: str | None = None
    tags: list[str] = []


class ItemUpdate(BaseModel):
    name: str | None = None
    description: str | None = None
    tags: list[str] | None = None



class ItemOut(BaseModel):
    id: str
    name: str
    description: str | None = None
    tags: list[str] = []
    created_at: datetime | None = None

    model_config = ConfigDict(from_attributes=True)



class HeavyReportOut(BaseModel):
    total_users: int
    total_items: int
    cache_hits: int
