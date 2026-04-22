# Use an official lightweight Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Cloud Run injects a PORT env var; the app must listen on it
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
