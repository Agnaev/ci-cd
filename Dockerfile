FROM python:3.9-alpine
WORKDIR /app
ADD requirements.txt ./
ADD . .
RUN pip install -r requirements.txt
CMD python /app/app.py