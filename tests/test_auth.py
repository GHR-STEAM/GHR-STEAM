from httpx import AsyncClient, ASGITransport
from src.main import app

import pytest


@pytest.mark.asyncio
async def test_register_login_flow():
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        r = await ac.post("/auth/register", json={
            "email": "test@example.com",
            "username": "testuser",
            "password": "secret123",
        })
        assert r.status_code == 201
        user = r.json()
        assert user["username"] == "testuser"

        r = await ac.post("/auth/login", json={
            "username": "testuser",
            "password": "secret123",
        })
        assert r.status_code == 200
        tokens = r.json()
        assert "access_token" in tokens
        assert "refresh_token" in tokens

        r = await ac.get("/auth/me", headers={"Authorization": f"Bearer {tokens['access_token']}"})
        assert r.status_code == 200
        assert r.json()["username"] == "testuser"

        r = await ac.post("/auth/refresh", json={"refresh_token": tokens["refresh_token"]})
        assert r.status_code == 200
        assert "access_token" in r.json()
