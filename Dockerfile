FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc python3-dev libpq-dev git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone and install the correct package direct from source
RUN pip install --no-cache-dir gunicorn django-manga-adventure

EXPOSE 10000

# Start the web script natively on Render's port standard
CMD ["gunicorn", "manga_adventure.wsgi:application", "--bind", "0.0.0.0:10000"]
