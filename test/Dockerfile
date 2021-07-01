FROM python:3.9

WORKDIR /home
COPY ./requirements.txt ./requirements.txt
COPY ./mytest.py ./mytest.py
# install library
RUN	pip install -r requirements.txt
EXPOSE	3306

ENTRYPOINT	["python","mytest.py"]
