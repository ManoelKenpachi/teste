import cx_Oracle
import time
import timeit
inicio = timeit.default_timer()

con = cx_Oracle.connect('usuario/senha@tnsname')

cursor = con.cursor() 
cursor.execute('''select * from table''')
with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
    for record in cursor.fetchall() :
      f.write(str(record[0]) + ';' +
      str(record[1]) + ';' +
      str(record[2]) + ';' +
      str(record[3]) + '\n' 
                )