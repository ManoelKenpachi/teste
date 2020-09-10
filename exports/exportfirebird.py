import fdb
from datetime import datetime
path = 'C:\\NappAuditoria\\'
conn = fdb.connect(
    host='localhost',
    database='C:\\SCL\\Dados\\Elbrus.IB',
    user='SYSDBA',
    password='masterkey'
)
cursor = conn.cursor() 
cursor.execute('''SELECT  DT_MOV, CONTROLE, SITUACAO, case when situacao <> 'E' then 0 else VLR_LIQUIDO end, HORA_SAIDA FROM LOJB085 ''')
with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
        for record in cursor.fetchall() :
            f.write(str(record[0]) + ';' +
            str(record[1]) + ';' +
            str(record[2]) + ';' +
            str(record[3]) + ';' +
            str(record[4]) + '\n' 
                                )
