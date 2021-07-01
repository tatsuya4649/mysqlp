#!/bin/env python
import os
import pymysql

def test_wrapper(comment):
	def _test_wrapper(f):
		def _wrapper(*args,**kwargs):
			print("-----------------------")
			print(f"{comment} Start...")
			f(*args,**kwargs)
			print("-----------------------")
		return _wrapper
	return _test_wrapper

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

# DELETE TEST to MySQL Server
@test_wrapper("DELETE")
def delete_test(host,user,passwd,database,table,where):
	pass

# UPDATE TEST to MySQL Server
@test_wrapper("UPDATE")
def update_test(host,user,passwd,database,table,where):
	pass

# INSERT TEST to MySQL Server
@test_wrapper("INSERT")
def insert_test(host,user,passwd,database,table,value):
	pass

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
@test_wrapper("SELECT")
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
@test_wrapper("PING")
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

def test(host,user,passwd,database,table,where,values):
	ping_test(host,user,passwd,database)
	select_test(host,user,passwd,database,table,where)
	insert_test(host,user,passwd,database,table,values)
	update_test(host,user,passwd,database,table,values)
	delete_test(host,user,passwd,database,table,values)
	


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
	_VALUES=os.environ['TESTVALUES']
	_VALUES=_VALUES.replace('"','')
	print(f"MySQL TEST SERVER TABLE INSERT/UPDATE/DELETE VALUE => {_VALUES}")
	test(_HOST,_USER,_PASSWORD,_DATABASE,_TABLE,_WHERE,_VALUES)
