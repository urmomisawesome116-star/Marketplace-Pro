# 1. Use the official image for your language
FROM python:3.11-slim

# 2. Set the working directory
WORKDIR /app

# 3. Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy your local code to the container
COPY . .

# 5. EXACT REQUIREMENT: Listen on port 8080
ENV PORT 8080
EXPOSE 8080

# 6. Run your app (example for Flask/Gunicorn)
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app

