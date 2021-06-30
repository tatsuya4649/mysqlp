#!/bin/env python
import os
import pymysql


def test_wrapper(f):
	def _wrapper(*args,**kwargs):
		print("-----------------------")
		f(*args,**kwargs)
		print("-----------------------")
	return _wrapper

def connection(host,user,passwd):
	# Not Connect Specific Database
	conn = pymysql.connect(
		host=host,
		user=user,
		password=passwd,
		cursorclass=pymysql.cursors.DictCursor
	)
	return conn

# PING TEST to MySQL Server
def ping_test(conn):
	# now connection
	with conn:
		try:
			res = conn.ping()
		except pymysql.err.OperationalError as e:
			print(e)
	return

@test_wrapper
def test(host,user,passwd):
	conn = connection(host,user,passwd)
	ping_test(conn)


if __name__ == "__main__":
	_HOST=os.environ['TESTIP']
	_USER=os.environ['TESTUSER']
	_PASSWORD=os.environ['TESTPASSWD']
	test(_HOST,_USER,_PASSWORD)
