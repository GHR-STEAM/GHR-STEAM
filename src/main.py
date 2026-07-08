from contextlib import asynccontextmanager
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from src.api.auth import router as auth_router
from src.api.items import router as items_router
from src.api.reports import router as reports_router
from src.core.logging import setup_logging, logger
from src.core.events import ensure_group
from src.cache import close_redis


@asynccontextmanager
async def lifespan(app: FastAPI):
    setup_logging()
    ensure_group()
    logger.info("app started", app_name="GHR-STEAM API")
    yield
    await close_redis()
    logger.info("app stopped")


app = FastAPI(title="GHR-STEAM API", version="1.0.0", lifespan=lifespan)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/health")
async def health():
    return {"status": "ok", "version": "1.0.0"}


app.include_router(auth_router)
app.include_router(items_router)
app.include_router(reports_router)
