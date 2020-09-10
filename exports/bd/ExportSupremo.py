class ExportSupremo:
    #def __init__(self, host, user, passwd, database, sql):
    def __init__(self, host, user, passwd, database, sql, tns):    
        self.host = host,
        self.user = user,
        self.passwd = passwd,
        self.database = database,
        self.tns = tns,
        self.sql = sql

    def sqlite(self):
        print('sqlite')
        import sqlite3
        from datetime import datetime

        path = 'c://NappAuditoria//'

        #o export precisa estar na pasta do banco, senão será necessário fazer copyfile ou passar o caminho do banco na host
        conn = sqlite3.connect('{0}'.format(self.database))

        cursor = conn.cursor() 

        cursor.execute('{0}'.format(self.sql))

        with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
                for record in cursor.fetchall() :
                    f.write(str(record[0]) + ';' +
                    str(record[1]) + ';' +
                    str(record[2]) + ';' +
                    str(record[3]) + '\n' 
                                        )
        return


    def mysql(self):

        import mysql.connector
        import time
        import timeit

        inicio = timeit.default_timer()
        path = 'c://NappAuditoria//'

        mydb = mysql.connect(
                                        host= 'localhost',
                                        user= 'SYSDBA'
                                        password= 'masterkey',
                                        database= 'AGORAVAI.FDB'
        )

        cursor = mydb.cursor() 

        cursor.execute(select * from tabela)
        t = cursor.execute(select * from tabela)
        print(t)

        with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
            for record in cursor.fetchall() :
                f.write(str(record[0]) + ';' +
                str(record[1]) + ';' +
                str(record[2]) + ';' +
                str(record[3]) + '\n' 
                            )
        return

    def firebird(self):
        
        import firebirdsql
        #se não for, tentar biblioteca fdb
        from datetime import datetime

        conn = firebirdsql.connect(
            host='localhost',
            database='C:\\Users\\Manoel\\Desktop\\bd\\AGORAVAI.FDB',
            port=3050,
            user='SYSDBA',
            password='masterkey'
        )
        
        path = 'C:\\NappAuditoria\\'

       
        cursor = conn.cursor() 
        cursor.execute(select * from tabela)
        t = cursor.execute(select * from tabela)
        print(t)

        with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
                for record in cursor.fetchall() :
                    f.write(str(record[0]) + ';' +
                    str(record[1]) + ';' +
                    str(record[2]) + ';' +
                    str(record[3]) + '\n' 
                                        )
        return


    def postgress(self):

        import psycopg2
        #from pyPgSQL import PgSQL, se não consultar portal 
        import time
        import timeit

        inicio = timeit.default_timer()
        path = 'c://NappAuditoria//'

        con = PgSQL.connect(
            host= self.host,
            user= self.user,
            password= self.passwd,
            database= self.database
        )

        cursor = con.cursor() 
        cursor.execute('{0}'.format(self.sql))
        with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
            for record in cursor.fetchall() :
                f.write(str(record[0]) + ';' +
                str(record[1]) + ';' +
                str(record[2]) + ';' +
                str(record[3]) + '\n' 
                            )
        return

    def oracle(self):

        import cx_Oracle
        import time
        import timeit

        inicio = timeit.default_timer()
        path = 'c://NappAuditoria//'

        con = cx_Oracle.connect('{0}/{1}@{2}'.format(self.user, self.passwd, self.tns))

        cursor = con.cursor() 
        cursor.execute('{0}'.format(self.sql))

        with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
            for record in cursor.fetchall() :
                f.write(str(record[0]) + ';' +
                str(record[1]) + ';' +
                str(record[2]) + ';' +
                str(record[3]) + '\n' 
                        )
        return
    
    def acess(self):      

        import pyodbc
        import time
        import timeit

        con = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ={0}{1}}".format(self.host, self.banco)
        
        cursor = con.cursor() 
        cursor.execute('{0}'.format(self.sql))

        with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
            for record in cursor.fetchall() :
                f.write(str(record[0]) + ';' +
                str(record[1]) + ';' +
                str(record[2]) + ';' +
                str(record[3]) + '\n' 
                        )
        return

    def dbf(self):
        from sqlalchemy import create_engine
        from datetime import date, datetime
        from dbfread import DBF
        import pandas as pd
        import glob
        import os
        engine = create_engine('sqlite://', echo=False)

        count = 0
        data_atual = date.today()

        pathBD = self.database

        files = glob.glob(pathBD)
        matriz = []
        for file in files:
           for record in DBF(file):
               matriz.append(record)

        df = pd.DataFrame(matriz)
        df.to_sql('vendas', con=engine, if_exists='append')
        df = pd.DataFrame(engine.execute(self.sql).fetchall())

        df.to_csv(path + 'Malonouus.csv', sep=';', index=False, header=False)
