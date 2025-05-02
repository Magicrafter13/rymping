# syntax=docker/dockerfile:1

FROM python:3

LABEL org.opencontainers.image.title="Renewing Your Mind Discord Bot"
LABEL org.opencontainers.image.description="Make posts when the RYM RSS feed updates."
LABEL org.opencontainers.image.authors="self@matthewrease.net"

# Files

WORKDIR /app

## Python Packages

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt --root-user-action=ignore

## Main Files

COPY rymping ./

# Runtime

ENV PYTHONDONTWRITEBYTECODE=1

CMD ["python3", "rymping"]
