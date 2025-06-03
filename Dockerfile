FROM python:3.12.3
WORKDIR /app

COPY . .

# Ensure this directory exists
RUN mkdir -p /app/sessions

RUN apt-get update && \
    apt-get install -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r master.txt

CMD ["python", "./main.py"]
