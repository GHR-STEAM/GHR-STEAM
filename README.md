# GHR-STEAM

## تشغيل محلي سريع
1. docker-compose up -d
2. python -m venv .venv && source .venv/bin/activate
3. pip install -r requirements.txt
4. alembic -c alembic.ini upgrade head
5. uvicorn src.main:app --reload

## CI
GitHub Actions يشغّل MongoDB, Redis, Postgres, يطبّق Alembic ويشغّل pytest.

## إعدادات مهمة
- أضف Secrets في GitHub: MONGO_URI, REDIS_URL, POSTGRES_URL, DATABASE_URL, SECRET_KEY
