FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY __init__.py /app/
COPY code_wallet/ /app/code_wallet/
COPY tests/ /app/tests/

CMD ["python", "-m", "unittest", "discover", "-v", "-s", "tests"]