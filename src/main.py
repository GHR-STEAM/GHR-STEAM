from fastapi import FastAPI
from src.database import get_db
from src.cache import get_redis

app = FastAPI()

@app.get("/health")
async def health():
    return {"status": "ok"}
