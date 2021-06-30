FROM python:3.9

WORKDIR /home
COPY ./requirements.txt .
COPY ./mytest.py .
# install library
RUN	pip install -r requirements.txt
EXPOSE	3306

CMD	["python","mytest.sh"]
