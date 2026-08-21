FROM ghcr.io/suwayomi/suwayomi-server:latest

EXPOSE 4567
ENV SUWAYOMI_SERVER_PORT=4567
ENV SUWAYOMI_SERVER_IP=0.0.0.0

ENV SUWAYOMI_SERVER_EXTENSION_REPOS='["https://githubusercontent.com"]'
