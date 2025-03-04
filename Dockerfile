FROM python:3.9

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

ENV PYTHONNUNBUFFERED 1

CMD ["python","app.py"]