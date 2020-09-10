import psycopg2
#from pyPgSQL import PgSQL, se não consultar portal 
import time
import timeit

inicio = timeit.default_timer()

con = PgSQL.connect(host='servidor',
                    database='banco de dados',
                    user='usuario',
                    password='senha')

cursor = con.cursor() 
cursor.execute('''select c_cod_pedido, c_data_pedido, c_valor_total_pedido, c_pedido_fechado  from pe0100''')
with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
    for record in cursor.fetchall() :
      f.write(str(record[0]) + ';' +
      str(record[1]) + ';' +
      str(record[2]) + ';' +
      str(record[3]) + '\n' 
                )
