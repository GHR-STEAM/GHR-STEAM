from src.database import get_client, get_db


def test_mongo_connection():
    client = get_client()
    info = client.server_info()
    assert info["ok"] == 1


def test_db_insert_and_find():
    db = get_db()
    col = db.test_collection
    col.insert_one({"hello": "world"})
    doc = col.find_one({"hello": "world"})
    assert doc is not None
    assert doc["hello"] == "world"
    col.delete_many({})
