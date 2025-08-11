ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN apt update && \
    apt upgrade -y && \
    apt install -y nodejs npm && \
    npm install -g @qwen-code/qwen-code@latest
