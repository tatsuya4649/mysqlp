#!/bin/env python
import os
import pymysql


def test_wrapper(f):
	def _wrapper(*args,**kwargs):
		print("-----------------------")
		f(*args,**kwargs)
		print("-----------------------")
	return _wrapper

def connection(host,user,passwd,database):
	# Not Connect Specific Database
	conn = pymysql.connect(
		host=host,
		user=user,
		password=passwd,
		database=database,
		cursorclass=pymysql.cursors.DictCursor
	)
	return conn

# SELECT TEST to MySQL Server
def _select(conn,table,where):
	sql = f"SELECT * FROM {table} WHERE {where}"
	print(sql)
	with conn.cursor() as cursor:
		cursor.execute(sql)

		results = cursor.fetchall()
		for r in results:
			print(r)
	return
@test_wrapper
def select_test(host,user,passwd,database,table,where):
	# new connection
	conn = connection(host,user,passwd,database)
	with conn:
		try:
			_select(conn,table,where)
		except pymysql.err.OperationalError as e:
			print(e)
		else:
			print("Select SUCCESS!")
	return
# PING TEST to MySQL Server
@test_wrapper
def ping_test(host,user,passwd,database):
	# new connection
	conn = connection(host,user,passwd,database)
	with conn:
		try:
			res = conn.ping()
		except pymysql.err.OperationalError as e:
			print(e)
		else:
			print("Ping SUCCESS!")
	return

def test(host,user,passwd,database,table,where):
	ping_test(host,user,passwd,database)
	select_test(host,user,passwd,database,table,where)


if __name__ == "__main__":
	_HOST=os.environ['TESTIP']
	_HOST=_HOST.replace('"','').split('/')[0]
	print(f"MySQL TEST SERVER IP ADDRESS => {_HOST}")
	_USER=os.environ['TESTUSER']
	print(f"MySQL TEST SERVER USER NAME => {_USER}")
	_PASSWORD=os.environ['TESTPASSWD']

	_DATABASE=os.environ['TESTDATABASE']
	print(f"MySQL TEST SERVER DATABASE NAME => {_DATABASE}")
	_TABLE=os.environ['TESTTABLE']
	print(f"MySQL TEST SERVER TABLE NAME => {_TABLE}")
	_WHERE=os.environ['TESTWHERE']
	_WHERE=_WHERE.replace('"','')
	print(f"MySQL TEST SERVER TABLE CONDITION => {_WHERE}")
	test(_HOST,_USER,_PASSWORD,_DATABASE,_TABLE,_WHERE)
