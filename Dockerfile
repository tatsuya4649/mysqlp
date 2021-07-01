FROM mysql:8.0

# move in etc directory
WORKDIR	/etc
# Copy setting file
COPY	./myconf mysql
EXPOSE	33306

# Setting Database/Table Schema
WORKDIR /home
COPY ./schema	./schema
RUN	mysql -u root -p < ./schema/*
