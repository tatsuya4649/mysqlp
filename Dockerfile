FROM mysql:8.0

WORKDIR	/etc
# Copy setting file
COPY	./myconf mysql
