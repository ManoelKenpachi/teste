object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 302
  Width = 219
  object BD: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Projeto_Facul\Banco_Clube\CLUBE.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 32
    Top = 24
  end
  object TRANS: TIBTransaction
    Active = True
    DefaultDatabase = BD
    AutoStopAction = saNone
    Left = 128
    Top = 22
  end
  object SQL1: TIBQuery
    Database = BD
    Transaction = TRANS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 32
    Top = 87
  end
  object DS_SQL1: TDataSource
    DataSet = SQL1
    Left = 132
    Top = 83
  end
  object DS_SQL2: TDataSource
    DataSet = SQL2
    Left = 132
    Top = 147
  end
  object SQL2: TIBQuery
    Database = BD
    Transaction = TRANS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 32
    Top = 151
  end
  object DS_SQL3: TDataSource
    DataSet = SQL3
    Left = 132
    Top = 203
  end
  object SQL3: TIBQuery
    Database = BD
    Transaction = TRANS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 32
    Top = 207
  end
end
