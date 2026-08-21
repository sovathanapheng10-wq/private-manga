FROM ghcr.io/suwayomi/suwayomi-server:latest

# Force the application to bind directly to port 10000 (Render's absolute default web port)
EXPOSE 10000
ENV SUWAYOMI_SERVER_PORT=10000
ENV SUWAYOMI_SERVER_IP=0.0.0.0

# Pre-inject the extension repository directly into the server start script
RUN mkdir -p /home/suwayomi/.local/share/Suwayomi-Server/ && \
    echo '{"extensionRepos": ["https://githubusercontent.com"]}' > /home/suwayomi/.local/share/Suwayomi-Server/server_config.json
