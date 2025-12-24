# LLM-Powered Log Analysis System (RAG + Anomaly Detection)
# Build: docker build -t llm-log-analyzer .
# Run:   docker run --rm -p 8000:8000 llm-log-analyzer

FROM python:3.11-slim

# Optional: faster/cleaner python behavior
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

# System deps (keep minimal)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install python deps first for better caching
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY app ./app
COPY data ./data
COPY config.yaml .
# (optional) include README
COPY README.md ./

# Build FAISS index + meta at image build time
# If you prefer building at runtime, remove this line and run it in entrypoint.
RUN python -c "from app.ingest import build_all; build_all('config.yaml')"

EXPOSE 8000

# Start API
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
