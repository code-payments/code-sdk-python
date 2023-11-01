FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY __init__.py /app/
COPY src/ /app/src/
COPY tests/ /app/tests/

CMD ["python", "-m", "unittest", "discover", "-s", "tests", "-v"]