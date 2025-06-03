FROM python:3.12.3
WORKDIR /app/
├── main.py
├── master.txt
├── plugins/
│   └── __init__.py (that uses `from modules import ...`)
└── modules/
    ├── __init__.py
    └── some_module.py

COPY . .
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r master.txt
CMD ["python", "./main.py"]
