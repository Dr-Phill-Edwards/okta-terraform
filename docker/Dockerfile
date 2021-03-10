FROM python:latest AS build
WORKDIR /app
COPY . /app/
RUN python -m venv /app
RUN bin/pip install -r requirements.txt
EXPOSE 8080
CMD ["python", "Server.py"]
