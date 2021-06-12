from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, scoped_session
from userbot import DB_URI
import re

if DB_URI.startswith("postgres://"):
    uri = DB_URI.replace("postgres://", "postgresql://", 1)
else:
   uri = DB_URI
BASE = declarative_base()

def start() -> scoped_session:
    engine = create_engine(uri)
    BASE.metadata.bind = engine
    BASE.metadata.create_all(engine)
    return scoped_session(sessionmaker(bind=engine, autoflush=False))


SESSION = start()
