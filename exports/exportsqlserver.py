import pyodbc
server = '<server>.database.windows.net'
database = '<database>'
username = '<username>'
password = '<password>'
driver= '{ODBC Driver 17 for SQL Server}'
con = pyodbc.connect('DRIVER='+driver+';SERVER='+server+';PORT=1433;DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = con.cursor() 
cursor.execute('''select * from table''')
with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
    for record in cursor.fetchall() :
      f.write(str(record[0]) + ';' +
      str(record[1]) + ';' +
      str(record[2]) + ';' +
      str(record[3]) + '\n' 
                )