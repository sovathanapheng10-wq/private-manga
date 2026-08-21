FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc python3-dev libpq-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone and set up the clean manga reader interface
RUN pip install --no-cache-dir manga-adventure gunicorn

# Initialize the internal tracking database
RUN manga-adventure migrate

EXPOSE 10000

# Start the web script natively on Render's port standard
CMD ["gunicorn", "manga_adventure.wsgi:application", "--bind", "0.0.0.0:10000"]
