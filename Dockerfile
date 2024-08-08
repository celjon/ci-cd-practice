FROM python:3.10-slim-buster
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt && apt update && apt install wget -y
COPY ./ ./
CMD ["python", "app.py"]
