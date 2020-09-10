from ExportSupremo import ExportSupremo

#Teste1ok: Sqlite, 

#Testar: Mysql, Postgress, Access, Firebird, Oracle e DBF
#Incrementar: Sql Server e Paradox (verificar nos exports já existentes)

#O host também deve ser usado como caminho do banco no firebird, acces, sqlite, dbf e paradox
#talvez ainda precise de mais uma váriavel banco, uma para conections que precisão da extesão e uma que não precisa

host = 'localhost'

user = 'SYSDBA'
passwd = 'masterkey'
database = 'C:\\Users\\Manoel\\Desktop\\bd\\AGORAVAI.FDB'

#Necessário para o banco Oracle
tns = ''

#Passar select sem o where data
sql = '''select * from tabela'''

#banco = ExportSupremo(host, user, passwd, database, sql)
banco = ExportSupremo(host, user, passwd, database, tns, sql)

#Trocar para 'banco.nomedobanco' ex: banco.firebird
banco.firebird()
