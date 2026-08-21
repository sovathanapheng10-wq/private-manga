FROM ghcr.io/suwayomi/suwayomi-server:latest

EXPOSE 4567
ENV SUWAYOMI_SERVER_PORT=4567
ENV SUWAYOMI_SERVER_IP=0.0.0.0

# This forces the website to pre-load the extension list from the backend server folder
RUN mkdir -p /home/suwayomi/.local/share/Suwayomi-Server/ && \
    echo '{"extensionRepos": ["https://githubusercontent.com"]}' > /home/suwayomi/.local/share/Suwayomi-Server/server_config.json
