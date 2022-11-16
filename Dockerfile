FROM python:3.8-slim

ADD src/ /src

RUN apt-get update

COPY deploy/requirements.txt /src/requirements.txt
RUN pip3 install -r /src/requirements.txt
EXPOSE 5566
CMD ["uvicorn", "src.api:app", "--host", "0.0.0.0", "--port", "5566"]
