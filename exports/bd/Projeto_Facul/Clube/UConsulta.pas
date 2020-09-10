unit UConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TFConsulta = class(TForm)
    DBG_Socio: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBG_Depen: TDBGrid;
    Label3: TLabel;
    DBGAti: TDBGrid;
    Bt_Fec: TBitBtn;
    procedure Buscar_Dados();
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsulta: TFConsulta;

implementation

uses UAtividade, UDependente, UDM, UPrincipal;

{$R *.dfm}

procedure TFConsulta.Buscar_Dados;
begin
  with dm.SQL1 do
  begin
    sql.Clear;
    sql.Add('select codigo,descricao,endereco,tel_res as telefone,tel_cel as celular from tbsocio order by descricao');
    prepare;
    open;
  end;
  begin
    with dm.SQL2 do
   begin
    sql.Clear;
    sql.Add('select codigo, desc_ati as Descricao, valor from tbatividade order by desc_ati ');
    prepare;
    open;
   end;
  end;
  begin
    with dm.SQL3 do
   begin
    sql.Clear;
    sql.Add('select * from tbdependentes order by descricao');
    prepare;
    open;
   end;
  end; 
end;

procedure TFConsulta.FormShow(Sender: TObject);
begin
  dm.BD.Connected := true;
  dm.TRANS.Active := true;
  Buscar_Dados;

end;

end.
