import os
from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()
# Облако (Render) само передаст переменную PORT. Локально мы зададим её вручную.
PORT = int(os.environ.get("PORT", 8000))

@app.get("/", response_class=HTMLResponse)
async def read_root():
    return "<h1>Привет из облака!</h1><p>Сайт работает автономно.</p>"
