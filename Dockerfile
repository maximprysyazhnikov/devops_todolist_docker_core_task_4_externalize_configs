FROM python:3.9-slim

# Системні залежності для PostgreSQL
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Встановити Python залежності
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіювати код
COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]