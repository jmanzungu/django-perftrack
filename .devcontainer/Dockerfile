FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    curl \
    git \
    gnupg2 \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Create user and set permissions
RUN useradd -m -s /bin/bash vscode && \
    mkdir -p /workspace && \
    chown -R vscode:vscode /workspace

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PATH="/home/vscode/.local/bin:$PATH"

# Switch to vscode user
USER vscode
WORKDIR /workspace

# Create virtual environment
RUN python -m venv /home/vscode/venv
ENV PATH="/home/vscode/venv/bin:$PATH"

# Install Python dependencies
COPY requirements.txt /tmp/
RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt
