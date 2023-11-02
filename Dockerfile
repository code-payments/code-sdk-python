FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

# Upgrade pip and install requirements
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt twine setuptools wheel

# Copy module and tests into the container
COPY code_wallet/ /app/code_wallet/
COPY tests/ /app/tests/

# Add setup-pypirc.sh
COPY setup-pypirc.sh /app/
RUN chmod +x /app/setup-pypirc.sh

CMD ["python", "-m", "unittest", "discover", "-v", "-s", "tests"]