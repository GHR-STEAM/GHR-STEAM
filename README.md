[![CI Pipeline](https://github.com/GHR-STEAM/GHR-STEAM/actions/workflows/ci.yml/badge.svg)](https://github.com/GHR-STEAM/GHR-STEAM/actions)
[![Docs](https://img.shields.io/badge/docs-GitHub%20Pages-blue)](https://ghr-steam.github.io/GHR-STEAM)
[![Dependabot](https://img.shields.io/badge/security-Dependabot-green)](https://github.com/GHR-STEAM/GHR-STEAM/security/dependabot)

# GHR-STEAM

منصة متكاملة لإدارة البيانات مع MongoDB, Redis, و PostgreSQL.

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
