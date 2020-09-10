class ExportSupremo:
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
        conn = db-sqlite3.connect(self.host + self.database)

        cursor = conn.cursor() 

        cursor.execute(self.sql)

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

        mydb = mysql.connector.connect(
                                        host= self.host,
                                        user= self.user,
                                        passwd= self.passwd,
                                        database= self.database
        )

        cursor = mydb.cursor() 

        cursor.execute(self.sql)

        with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
            for record in cursor.fetchall() :
                f.write(str(record[0]) + ';' +
                str(record[1]) + ';' +
                str(record[2]) + ';' +
                str(record[3]) + '\n' 
                            )
        return

    def firebird(self):
        import fdb
        from datetime import datetime
        path = 'c://NappAuditoria//'

        conn = fdb.connect(
                            host= self.host,
                            user= self.user,
                            passwd= self.passwd,
                            database= self.database
        
        )
        cursor = conn.cursor() 
        cursor.execute(self.sql)
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
                            passwd= self.passwd,
                            database= self.database
        )

        cursor = con.cursor() 
        cursor.execute(self.sql)
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

        con = cx_Oracle.connect(self.user + '/' + self.passwd + '@' + self.tns)

        cursor = con.cursor() 
        cursor.execute(self.sql)

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

        con = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" + self.host + self.banco
        
        cursor = con.cursor() 
        cursor.execute(self.sql)

        with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
            for record in cursor.fetchall() :
                f.write(str(record[0]) + ';' +
                str(record[1]) + ';' +
                str(record[2]) + ';' +
                str(record[3]) + '\n' 
                        )
        return