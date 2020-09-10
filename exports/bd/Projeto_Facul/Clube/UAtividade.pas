unit UAtividade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFAtividade = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edt_Cod: TEdit;
    Label2: TLabel;
    Edt_Desc_Ati: TEdit;
    StatusBar1: TStatusBar;
    Edt_Val: TEdit;
    Label3: TLabel;
    Bt_Nov: TBitBtn;
    Bt_Sal: TBitBtn;
    Bt_Alt: TBitBtn;
    Bt_Apa: TBitBtn;
    Bt_Fec: TBitBtn;
    Bt_Pri: TBitBtn;
    Bt_Ant: TBitBtn;
    Bt_Prox: TBitBtn;
    Bt_Ult: TBitBtn;
    Bt_Can: TBitBtn;
    function Verificar_Dados: Boolean;
    procedure Mostrar_Dados();
    procedure Limpar_Edits();
    {procedure Carrega_Combo();}
    procedure Buscar_Dados();
    procedure GerenciarBotoes(opc: Boolean);
    procedure GerenciarEdits(opc: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Bt_NovClick(Sender: TObject);
    procedure Bt_SalClick(Sender: TObject);
    procedure Bt_altClick(Sender: TObject);
    procedure Bt_ApaClick(Sender: TObject);
    procedure Bt_FecClick(Sender: TObject);
    procedure Bt_CanClick(Sender: TObject);
    procedure Bt_PriClick(Sender: TObject);
    procedure Bt_ProxClick(Sender: TObject);
    procedure Bt_AntClick(Sender: TObject);
    procedure Bt_UltClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtividade: TFAtividade;
  codigo: string;

implementation

uses UDM, USocio;

{$R *.dfm}

{ TFAtividade }

procedure TFAtividade.GerenciarBotoes(opc: Boolean);
begin
  Bt_Nov.Enabled := opc;
  Bt_Sal.Enabled := not opc;
  Bt_Alt.Enabled := opc;
  Bt_Apa.Enabled := opc;
  Bt_Can.Enabled := not opc;
  Bt_Pri.Enabled := opc;
  Bt_Ant.Enabled := opc;
  Bt_Prox.Enabled := opc;
  Bt_Ult.Enabled := opc;
  Bt_Fec.Enabled :=opc;
end;

procedure TFAtividade.GerenciarEdits(opc: Boolean);
begin
    Edt_Cod.Enabled := opc;
    Edt_Desc_Ati.Enabled  := opc;
    Edt_Val.Enabled  := opc;
end;

procedure TFAtividade.Limpar_Edits;
begin
    Edt_Cod.Text := '';
    Edt_Desc_Ati.Text := '';
    Edt_Val.Text := '';
end;

procedure TFAtividade.Mostrar_Dados;
begin
    with dm.SQL1 do
  begin
    Edt_Cod.Text := Fields [0].AsString;
    Edt_Desc_Ati.Text := Fields[1].AsString;
    Edt_Val.Text := FormatFloat('R$ 0.00', Fields[2].AsCurrency);
  end;
end;

function TFAtividade.Verificar_Dados: Boolean;
begin
    Verificar_Dados := true;
   if Edt_Desc_Ati.Text = '' then
    begin
     Application.MessageBox('Informe a Descrição da Atividade!','Campo Obrigatório',MB_OK+MB_ICONERROR);
     Edt_Desc_Ati.SetFocus;
     Verificar_Dados := false;
     exit;
    end;
   if Edt_Val.Text  = '' then
    begin
     Application.MessageBox('Informe o Valor da Atividade!','Campo Obrigatório',MB_OK+MB_ICONERROR);
     Edt_Val.SetFocus;
     Verificar_Dados := false;
    end;
end;

procedure TFAtividade.FormShow(Sender: TObject);
begin
  dm.BD.Connected := true;
  dm.TRANS.Active := true;
  Buscar_Dados;
  Mostrar_Dados;
  GerenciarEdits(false);
  GerenciarBotoes(true);
  Bt_fec.SetFocus;
end;

procedure TFAtividade.Buscar_Dados;
begin
  with dm.SQL1 do
  begin
    sql.Clear;
    sql.Add('select * from tbatividade order by desc_ati');
    prepare;
    open;
  end;
end;

procedure TFAtividade.Bt_NovClick(Sender: TObject);
begin
  codigo := Edt_Cod.Text;
  GerenciarEdits(True);
  Limpar_Edits;
  GerenciarBotoes(false);
  Edt_Desc_Ati.SetFocus;
  FAtividade.Caption := 'Incluindo Nova Atividade';
end;

procedure TFAtividade.Bt_SalClick(Sender: TObject);
begin
  if Verificar_Dados then
  begin
    if FAtividade.Caption= 'Incluindo Nova Atividade'then
      begin
        with dm.SQL1 do
         begin
          close;
          sql.Clear;
          sql.Add('insert into tbatividade values(null, :c1, :c2)');
          ParamByName('c1').Value := Edt_Desc_Ati.Text;
          ParamByName('c2').Value := strtofloat(Edt_Val.Text);
          try
            prepare;
            execsql;
            dm.TRANS.CommitRetaining;
            Application.MessageBox('Dados gravados com sucesso!','Gravação concluída!',MB_OK+MB_ICONWARNING);
          except
            Application.MessageBox('Erro na gravação!','Gravação NÃO concluída!',MB_OK+MB_ICONERROR);
            exit;
          end;
        end;
    end
    else
     begin
       with dm.SQL1 do
        begin
          close;
          sql.Clear;
          sql.Add('Update tbatividade set desc_Ati=:c1, valor=:c2 where codigo=:c0');
          ParamByName('c0').Value := Edt_Cod.Text;
          ParamByName('c1').Value := Edt_Desc_Ati.Text;
          ParamByName('c2').Value := strtofloat(Edt_Val.Text);
          try
            prepare;
            execsql;
            dm.TRANS.CommitRetaining;
            Application.MessageBox('Dados atualizados com sucesso!','Atualização',MB_OK+MB_ICONWARNING);
          except
            Application.MessageBox('Erro na alteração','Erro!',MB_OK+MB_ICONERROR);
          exit;
          end;
        end;
    end;
    GerenciarEdits(False);
    GerenciarBotoes(true);
    Bt_Nov.SetFocus;
    FAtividade.Caption := 'Cadastro de Atividades';
    Buscar_Dados;
    Mostrar_Dados;
  end;
end;

procedure TFAtividade.Bt_altClick(Sender: TObject);
begin
  codigo := Edt_Cod.Text;
  GerenciarEdits(True);
  GerenciarBotoes(false);
  FSocio.Caption := 'Alterando dados da Atividade';
  Edt_Desc_Ati.SetFocus;
end;

procedure TFAtividade.Bt_ApaClick(Sender: TObject);
begin
  if(application.MessageBox('Deseja excluir esse registo?','Apagando...',MB_YESNO+MB_ICONQUESTION)=ID_YES) then
  begin
    with dm.SQL1 do
    begin
      close;
      sql.clear;
      sql.Add('Delete from tbatividade where codigo=:c0');
      parambyname('c0').Value:=Edt_cod.Text;
      try
        prepare;
        execsql;
        dm.TRANS.CommitRetaining;
        application.MessageBox('Registro Excluido com Sucesso!','Aviso',MB_OK+MB_ICONWARNING);
        except
           application.MessageBox('Erro na Exclusão!','Aviso de Erro', MB_OK+MB_ICONERROR);
        exit;
      end;
    end;
   Buscar_Dados;
   Mostrar_Dados;
  end;
end;

procedure TFAtividade.Bt_FecClick(Sender: TObject);
begin
  FAtividade.Close;
end;

procedure TFAtividade.Bt_CanClick(Sender: TObject);
begin
//   codigo:=Edt_cod.Text;
//   {Recebe o código do Sócio que estávamos anteriormente, para podermos
//   voltar no registro antigo}
     GerenciarEdits(False);
     GerenciarBotoes(true);
     FSocio.Caption := 'Cadastro da Atividade';
     Bt_Nov.SetFocus;
     dm.SQL1.Locate('Codigo', VarArrayOf([codigo]),[]);
     Mostrar_Dados;
end;

procedure TFAtividade.Bt_PriClick(Sender: TObject);
begin
  dm.SQL1.First;
  Mostrar_Dados;
end;

procedure TFAtividade.Bt_ProxClick(Sender: TObject);
begin
  dm.SQL1.Next;
  Mostrar_Dados;
end;

procedure TFAtividade.Bt_AntClick(Sender: TObject);
begin
  dm.SQL1.Prior;
  Mostrar_Dados;
end;

procedure TFAtividade.Bt_UltClick(Sender: TObject);
begin
  dm.SQL1.Last;
  Mostrar_Dados;
end;

{procedure TFAtividade.Carrega_Combo;
begin
  with dm.SQL2 do
  begin
    sql.Clear;
    sql.Add('select * from tbdependente order by descricao');
    prepare;
    open;
  end;
end;}

end.
