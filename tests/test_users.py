import pytest
from httpx import ASGITransport, AsyncClient

from src.main import app


@pytest.mark.asyncio
async def test_users_endpoints():
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        # Register user 1
        r = await ac.post("/auth/register", json={
            "email": "user1@example.com",
            "username": "user1",
            "password": "password123",
        })
        assert r.status_code == 201
        u1 = r.json()
        u1_id = u1["id"]

        login_res = await ac.post("/auth/login", json={"username": "user1", "password": "password123"})
        token1 = login_res.json()["access_token"]
        headers1 = {"Authorization": f"Bearer {token1}"}


        # Get profile via /users/me
        r = await ac.get("/users/me", headers=headers1)
        assert r.status_code == 200
        assert r.json()["username"] == "user1"

        # Update profile
        r = await ac.patch("/users/me", json={"username": "user1_updated"}, headers=headers1)
        assert r.status_code == 200
        assert r.json()["username"] == "user1_updated"

        # Get user by id
        r = await ac.get(f"/users/{u1_id}")
        assert r.status_code == 200
        assert r.json()["username"] == "user1_updated"
