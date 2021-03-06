unit UDM;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, RpRave,
  RpDefine, RpBase, RpSystem;

type
  TDM = class(TDataModule)
    BD: TIBDatabase;
    TRANS: TIBTransaction;
    SQL1: TIBQuery;
    DS_SQL1: TDataSource;
    DS_SQL2: TDataSource;
    SQL2: TIBQuery;
    DS_SQL3: TDataSource;
    SQL3: TIBQuery;
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}


end.
