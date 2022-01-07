FROM python:slim

RUN pip install --no-cache-dir "poetry>=1.1"

WORKDIR /opt/app

COPY pyproject.toml poetry.lock .
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev --no-interaction --no-ansi

COPY pavlov_generator pavlov_generator
COPY wsgi.py .

CMD ["gunicorn", "--worker-class", "gevent", "--bind", "0.0.0.0:8080", "wsgi:app"]
