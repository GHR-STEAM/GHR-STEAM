import pytest
from httpx import ASGITransport, AsyncClient

from src.main import app


@pytest.mark.asyncio
async def test_create_and_list_item():
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        r = await ac.post("/auth/register", json={
            "email": "itemuser@example.com",
            "username": "itemuser",
            "password": "pass",
        })
        token = (await ac.post("/auth/login", json={"username": "itemuser", "password": "pass"})).json()["access_token"]
        headers = {"Authorization": f"Bearer {token}"}

        r = await ac.post("/items/", json={"name": "Test Item", "tags": ["demo"]}, headers=headers)
        assert r.status_code == 201
        item = r.json()
        assert item["name"] == "Test Item"

        r = await ac.get("/items/", headers=headers)
        assert r.status_code == 200
        items = r.json()
        assert any(i["name"] == "Test Item" for i in items)
