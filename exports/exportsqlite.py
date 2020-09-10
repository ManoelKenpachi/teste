import sqlite3
from datetime import datetime
path = 'C:\\Users\pc\\Desktop\\bdteste\\'
#o export precisa estar na pasta do banco, senão será necessário fazer copyfile ou passar o caminho do banco
conn = sqlite3.connect('QL0304.db')

cursor = conn.cursor() 

cursor.execute('''SELECT  * FROM DateRange''')
with open(path + datetime.now() .strftime('%Y%m%d%H%H%S') + '.csv', 'w') as f:
        for record in cursor.fetchall() :
            f.write(str(record[0]) + ';' +
            str(record[1]) + ';' +
            str(record[2]) + ';' +
            str(record[3]) + '\n' 
                                )
