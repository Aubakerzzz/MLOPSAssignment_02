FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

# Use gunicorn for production
CMD ["sh", "-c", "gunicorn -b 0.0.0.0:$PORT app:app"]

