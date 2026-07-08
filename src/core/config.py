from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    app_name: str = "GHR-STEAM API"

    mongo_uri: str = "mongodb://127.0.0.1:27017/testdb"
    postgres_url: str = "postgresql+asyncpg://postgres:postgres@127.0.0.1:5432/testdb"
    redis_url: str = "redis://127.0.0.1:6379"
    redis_enabled: bool = True

    secret_key: str = "change-me-in-production"
    algorithm: str = "HS256"
    access_token_expire_minutes: int = 30
    refresh_token_expire_days: int = 7

    log_level: str = "INFO"
    json_logs: bool = False

    class Config:
        env_file = ".env"


settings = Settings()
