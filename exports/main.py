from ExportSupremo import ExportSupremo


#Testar: Mysql, Postgress, Access, Firebird, Oracle, Sqlite
#Incrementar: DBF, Sql Server e Paradox (verificar nos exports já existentes)

#O host também deve ser usado como caminho do banco no firebird, acces, sqlite, dbf e paradox
#talvez ainda precise de mais uma váriavel banco, uma para conections que precisão da extesão e uma que não precisa

host = 'localhost'

user = 'root'
passwd = 'napp154878'
database = 'bdteste'

#Necessário para o banco Oracle
tns = 'nometns'

#Passar select sem o where data
sql = '''select * from table'''

banco = ExportSupremo(host, user, passwd, database, tns, sql)

#Trocar para 'banco.nomedobanco' ex: banco.firebird
banco.sqlite()