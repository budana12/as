FROM python:3.12.3

# Create app and session directories
WORKDIR /app

# Copy all project files
COPY . .

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r master.txt

# Make sure session directory exists (optional if you handle it in code)
RUN mkdir -p /app/sessions

# Run the bot
CMD ["python", "./main.py"]
