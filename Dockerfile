# Берем легковесный официальный образ Python
FROM python:3.11-slim

# Создаем рабочую папку внутри контейнера
WORKDIR /app

# Копируем файл зависимостей и устанавливаем их
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь остальной код
COPY . .

# Запускаем сервер. Важно: слушаем 0.0.0.0 (все интерфейсы), а порт берем из переменной окружения
CMD uvicorn main:app --host 0.0.0.0 --port $PORT
