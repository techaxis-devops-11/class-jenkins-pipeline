From python:3

MAINTAINER Shramik

RUN pip install flask
RUN pip install flask_restful

ADD python.py /python.py

WORKDIR /
EXPOSE 80
CMD ["python", "/python.py"]
