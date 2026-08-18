import pytest
from httpx import ASGITransport, AsyncClient

from src.main import app


@pytest.mark.asyncio
async def test_heavy_report():
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        r = await ac.post("/auth/register", json={
            "email": "reportuser@example.com",
            "username": "reportuser",
            "password": "password123",
        })
        login_res = await ac.post("/auth/login", json={"username": "reportuser", "password": "password123"})
        token = login_res.json()["access_token"]
        headers = {"Authorization": f"Bearer {token}"}


        r = await ac.get("/reports/heavy", headers=headers)
        assert r.status_code == 200
        data = r.json()
        assert "total_users" in data
        assert "total_items" in data
        assert "cache_hits" in data
