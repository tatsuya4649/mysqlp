FROM mysql:8.0

EXPOSE	3306

# initial schema
COPY	./schema/database.sql	/docker-entrypoint-initdb.d/databse.sql
COPY	./schema/table.sql	/docker-entrypoint-initdb.d/table.sql
