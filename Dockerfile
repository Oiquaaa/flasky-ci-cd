FROM python:3.8-slim

ENV FLASK_APP=flasky.py
ENV FLASK_CONFIG=development
ENV FLASK_ENV=development

WORKDIR /app

COPY requirements-ci.txt .
RUN pip install --no-cache-dir -r requirements-ci.txt

COPY . .

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

