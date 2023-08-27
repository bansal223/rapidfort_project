FROM python:3.8-slim

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN pip install -r requirement.txt

RUN apt-get update && apt-get install -y libmagic1 && apt-get clean

EXPOSE 5000

CMD ["python", "app.py"]
