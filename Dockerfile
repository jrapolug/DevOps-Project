FROM python:3.9-slim

WORKDIR app

COPY . /app

RUN pip install django

RUN python manage.py makemigrations

RUN python manage.py migrate

EXPOSE 8000

CMD ["python","manage.py","runserver","0.0.0.0:8000"]
