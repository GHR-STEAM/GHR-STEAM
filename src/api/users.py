from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from src.api.deps import get_current_user
from src.core.logging import logger
from src.database import get_pg_session
from src.models import User
from src.schemas.auth import UserOut

router = APIRouter(prefix="/users", tags=["users"])


class UpdateProfileRequest(BaseModel):
    email: str | None = None
    username: str | None = None


@router.get("/me", response_model=UserOut)
async def get_my_profile(user: User = Depends(get_current_user)):
    return user


@router.patch("/me", response_model=UserOut)
async def update_profile(
    body: UpdateProfileRequest,
    user: User = Depends(get_current_user),
    db: AsyncSession = Depends(get_pg_session),
):
    if body.email is not None:
        result = await db.execute(select(User).where(User.email == body.email, User.id != user.id))
        if result.scalar_one_or_none():
            raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Email already taken")
        user.email = body.email
    if body.username is not None:
        result = await db.execute(select(User).where(User.username == body.username, User.id != user.id))
        if result.scalar_one_or_none():
            raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Username already taken")
        user.username = body.username
    await db.commit()
    await db.refresh(user)
    logger.info("profile updated", user_id=user.id)
    return user


@router.get("/{user_id}", response_model=UserOut)
async def get_user(user_id: int, db: AsyncSession = Depends(get_pg_session)):
    result = await db.execute(select(User).where(User.id == user_id))
    user = result.scalar_one_or_none()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    return user

