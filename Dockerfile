FROM python:3.9-slim

# Встановити системні залежності
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Встановити робочу директорію
WORKDIR /app

# Копіювати requirements і встановити Python залежності
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіювати код проекту
COPY . .

# Відкрити порт 8000
EXPOSE 8000

# Команда за замовчуванням
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]