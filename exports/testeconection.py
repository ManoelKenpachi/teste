import firebirdsql
conn = firebirdsql.connect(
    host='localhost',
    database='C:/Users/Manoel/Desktop/bd/AGORAVAI.FDB',
    port=3050,
    user='SYSDBA',
    password='masterkey'
)
cur = conn.cursor()
cur.execute("select * from tabela")
for c in cur.fetchall():
    print(c)
conn.close()
