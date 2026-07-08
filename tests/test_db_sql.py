from src.db_sql import check_connection, get_session, engine
from sqlalchemy import text


def test_postgres_connection():
    assert check_connection() is True


def test_alembic_migration_applied():
    with engine.connect() as conn:
        result = conn.execute(
            text("SELECT table_name FROM information_schema.tables WHERE table_schema='public'")
        )
        tables = [row[0] for row in result]
    assert "users" in tables, "Alembic migration did not create the 'users' table"


def test_insert_and_query_user():
    session = get_session()
    session.execute(
        text("INSERT INTO users (name, email) VALUES (:name, :email)"),
        {"name": "Test User", "email": "test@example.com"},
    )
    session.commit()

    result = session.execute(
        text("SELECT name, email FROM users WHERE email = :email"),
        {"email": "test@example.com"},
    )
    row = result.fetchone()
    assert row is not None
    assert row[0] == "Test User"
    assert row[1] == "test@example.com"

    session.execute(
        text("DELETE FROM users WHERE email = :email"),
        {"email": "test@example.com"},
    )
    session.commit()
    session.close()
