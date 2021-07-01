#!/bin/bash

mysql -u root -pmysql < schema/database.sql
mysql -u root -pmysql < schema/table.sql
