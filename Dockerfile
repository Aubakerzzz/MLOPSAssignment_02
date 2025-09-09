FROM python:3.10-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app source code
COPY . .

# Expose port 8000 for Azure
EXPOSE 8000

# Use gunicorn directly for production
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]
