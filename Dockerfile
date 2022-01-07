FROM python:slim

RUN pip install --no-cache-dir pipenv==2020.11.15

WORKDIR /opt/app

COPY Pipfile* .
RUN pipenv install --system

COPY src src
COPY wsgi.py .

CMD ["gunicorn", "--worker-class", "gevent", "--bind", "0.0.0.0:8080", "wsgi:app"]
