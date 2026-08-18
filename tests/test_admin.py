import pytest
from httpx import ASGITransport, AsyncClient

from src.main import app


@pytest.mark.asyncio
async def test_admin_endpoints():
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        r = await ac.post("/auth/register", json={
            "email": "adminuser@example.com",
            "username": "adminuser",
            "password": "password123",
        })
        login_res = await ac.post("/auth/login", json={"username": "adminuser", "password": "password123"})
        token = login_res.json()["access_token"]
        headers = {"Authorization": f"Bearer {token}"}


        r = await ac.get("/admin/stats", headers=headers)
        assert r.status_code == 200
        data = r.json()
        assert "total_users" in data
        assert "total_items" in data

        r = await ac.get("/admin/health/full", headers=headers)
        assert r.status_code == 200
        data = r.json()
        assert "status" in data
        assert "checks" in data
