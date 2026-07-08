from fastapi import APIRouter, Depends, HTTPException, status
from bson import ObjectId
from datetime import datetime, timezone
from src.database import get_mongo_collection
from src.schemas.item import ItemCreate, ItemOut
from src.api.deps import get_current_user
from src.models import User

router = APIRouter(prefix="/items", tags=["items"])


@router.post("/", response_model=ItemOut, status_code=201)
async def create_item(body: ItemCreate, user: User = Depends(get_current_user)):
    col = get_mongo_collection("items")
    doc = {
        "name": body.name,
        "description": body.description,
        "tags": body.tags,
        "owner_id": user.id,
        "created_at": datetime.now(timezone.utc),
    }
    result = await col.insert_one(doc)
    doc["id"] = str(result.inserted_id)
    return ItemOut(**doc)


@router.get("/", response_model=list[ItemOut])
async def list_items(user: User = Depends(get_current_user)):
    col = get_mongo_collection("items")
    cursor = col.find({"owner_id": user.id}).sort("created_at", -1).limit(50)
    items = []
    async for doc in cursor:
        doc["id"] = str(doc.pop("_id"))
        items.append(ItemOut(**doc))
    return items


@router.get("/{item_id}", response_model=ItemOut)
async def get_item(item_id: str, user: User = Depends(get_current_user)):
    col = get_mongo_collection("items")
    doc = await col.find_one({"_id": ObjectId(item_id), "owner_id": user.id})
    if not doc:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Item not found")
    doc["id"] = str(doc.pop("_id"))
    return ItemOut(**doc)
