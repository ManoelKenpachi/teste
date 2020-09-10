unit UDependente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ComCtrls;

type
  TFDependentes = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edt_Cod: TEdit;
    Label2: TLabel;
    Edt_Desc_Dep: TEdit;
    Label3: TLabel;
    Edt_ECi_Dep: TEdit;
    Label4: TLabel;
    Edt_Nasc_Dep: TEdit;
    DBLkCBSocio: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Edt_Ida_Dep: TEdit;
    Edt_Par: TEdit;
    Label7: TLabel;
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
    procedure Buscar_Dados();
    procedure Mostrar_Dados();
    procedure Carrega_Combo();
    procedure GerenciarBotoes(opc:Boolean);
    procedure GerenciarEdits(opc: Boolean);
    procedure LimparEdits;
    procedure FormShow(Sender: TObject);
    procedure Bt_FecClick(Sender: TObject);
    procedure Bt_NovClick(Sender: TObject);
    procedure Bt_SalClick(Sender: TObject);
    procedure Bt_AltClick(Sender: TObject);
    procedure Bt_CanClick(Sender: TObject);
    procedure Bt_ApaClick(Sender: TObject);
    procedure Bt_PriClick(Sender: TObject);
    procedure Bt_AntClick(Sender: TObject);
    procedure Bt_ProxClick(Sender: TObject);
    procedure Bt_UltClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDependentes: TFDependentes;
  codigo: string;
implementation

uses UPrincipal, USocio, UDM;

{$R *.dfm}

procedure TFDependentes.GerenciarBotoes(opc: Boolean);
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

procedure TFDependentes.GerenciarEdits(opc: Boolean);
begin
    Edt_Cod.Enabled := opc;
    Edt_Desc_Dep.Enabled  := opc;
    Edt_ECi_Dep.Enabled  := opc;
    Edt_Nasc_Dep.Enabled:= opc;
    Edt_Ida_Dep.Enabled := opc;
    Edt_Par.Enabled := opc;
    DBLkCBSocio.Enabled := opc;
end;

procedure TFDependentes.LimparEdits;
begin
    Edt_Cod.Text := '';
    Edt_Desc_Dep.Text := '';
    Edt_ECi_Dep.Text := '';
    Edt_Nasc_Dep.Text := '';
    Edt_Ida_Dep.Text := '';
    Edt_Par.Text := '';
    DBLkCBSocio.KeyValue := -1;
end;

function TFDependentes.Verificar_Dados: Boolean;
begin
   Verificar_Dados := true;
   if Edt_Desc_Dep.Text = '' then
    begin
     Application.MessageBox('Informe a Descrição do Dependente!','Campo Obrigatório',MB_OK+MB_ICONERROR);
     Edt_Desc_Dep.SetFocus;
     Verificar_Dados := false;
     exit;
    end;
   if Edt_ECi_Dep.Text  = '' then
    begin
     Application.MessageBox('Informe o Estado Civil do Dependente!','Campo Obrigatório',MB_OK+MB_ICONERROR);
     Edt_ECi_Dep.SetFocus;
     Verificar_Dados := false;
    end;
   if Edt_Nasc_Dep.Text = '' then
    begin
      Application.MessageBox('Informe a Data de Nascimento do Dependente!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Nasc_Dep .SetFocus;
      Verificar_Dados := false;
    end;
   if Edt_Ida_Dep.Text = '' then
    begin
      Application.MessageBox('Informe a Idade do Dependente!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Ida_Dep.SetFocus;
      Verificar_Dados := false;
    end;
    if Edt_Par.Text = '' then
    begin
      Application.MessageBox('Informe o Grau de Parentesco do Dependente!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Par.SetFocus;
      Verificar_Dados := false;
    end;
    {if DBLkCBSocio.KeyValue = '' then
    begin
      Application.MessageBox('Informe Nome do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      DBLkCBSocio.SetFocus;
      Verificar_Dados := false;
    end; }
end;

procedure TFDependentes.FormShow(Sender: TObject);
begin
  dm.BD.Connected := true;
  dm.TRANS.Active := true;
  DBLkCBSocio.ListSource := DM.DS_SQL2;
  DBLkCBSocio.ListField  := 'descricao';
  DBLkCBSocio.KeyField := 'codigo';
  Buscar_Dados;
  Mostrar_Dados;
  GerenciarEdits(false);
  GerenciarBotoes(true);
  Bt_fec.SetFocus;
end;

procedure TFDependentes.Mostrar_Dados;
begin
  with dm.SQL1 do
  begin
    Edt_Cod.Text := Fields [0].AsString;
    Edt_Desc_Dep.Text := Fields[1].AsString;
    Edt_ECi_Dep.Text := Fields[2].AsString;
    Edt_Nasc_Dep.Text := Fields[3].AsString;
    Edt_Ida_Dep.Text := Fields[4].AsString;
    Edt_Par.Text := Fields[5].AsString;
    DBLkCBSocio.KeyValue := Fields[6].AsString;
  end;
end;

procedure TFDependentes.Buscar_Dados;
begin
  with dm.SQL1 do
  begin
    sql.Clear;
    sql.Add('select * from tbdependentes order by descricao');
    prepare;
    open;
  end;
  carrega_combo;
end;

procedure TFDependentes.Carrega_Combo;
begin
 with dm.SQL2 do
  begin
    sql.Clear;
    sql.Add('select * from tbsocio order by descricao');
    prepare;
    open;
 end;

end;

procedure TFDependentes.Bt_FecClick(Sender: TObject);
begin
  FDependentes.Close;
end;

procedure TFDependentes.Bt_NovClick(Sender: TObject);
begin
  codigo := Edt_Cod.Text;
  GerenciarEdits(True);
  LimparEdits;
  GerenciarBotoes(false);
  Edt_Desc_Dep.SetFocus;
  FDependentes.Caption := 'Incluindo Novo Dependente';
end;

procedure TFDependentes.Bt_SalClick(Sender: TObject);
begin

 if Verificar_Dados then
  begin
    if FDependentes.Caption= 'Incluindo Novo Dependente'then
     begin
       with dm.SQL1 do
        begin
          close;
          sql.Clear;
          sql.Add('insert into tbdependentes values(null, :c1, :c2, :c3, :c4, :c5, :c6)');
          ParamByName('c1').Value := Edt_Desc_Dep.Text;
          ParamByName('c2').Value := Edt_ECi_Dep.Text;
          ParamByName('c3').Value := Edt_Nasc_Dep.Text;
          ParamByName('c4').Value := Edt_Ida_Dep.Text;
          ParamByName('c5').Value := Edt_Par.Text;
          ParamByName('c6').Value := DBLkCBSocio.KeyValue;
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
          sql.Add('Update tbdependentes set descricao=:c1, est_civ=:c2, dt_nasc=:c3, ida=:c4, parent=:c5, cod_socio=:c6 where codigo=:c0');
          ParamByName('c0').Value := Edt_Cod.Text;
          ParamByName('c1').Value := Edt_Desc_Dep.Text;
          ParamByName('c2').Value := Edt_ECi_Dep.Text;
          ParamByName('c3').Value := Edt_Nasc_Dep.Text;
          ParamByName('c4').Value := Edt_Ida_Dep.Text;
          ParamByName('c5').Value := Edt_Par.Text;
          ParamByName('c6').Value := DBLkCBSocio.KeyValue;
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
    FDependentes.Caption := 'Cadastro de Dependente';
    Buscar_Dados;
    Mostrar_Dados;
  end;
end;

procedure TFDependentes.Bt_AltClick(Sender: TObject);
begin
   codigo := Edt_Cod.Text;
  GerenciarEdits(True);
  GerenciarBotoes(false);
  FDependentes.Caption := 'Alterando dados do Dependente';
  Edt_Desc_Dep.SetFocus;
end;

procedure TFDependentes.Bt_CanClick(Sender: TObject);
begin
//codigo:=Edt_cod.Text;
  GerenciarEdits(False);
  GerenciarBotoes(true);
  FDependentes.Caption := 'Cadastro de Dependente';
  Bt_Nov.SetFocus;
  dm.SQL1.Locate('Codigo', VarArrayOf([codigo]),[]);
  Mostrar_Dados;
end;

procedure TFDependentes.Bt_ApaClick(Sender: TObject);
begin

  if(application.MessageBox('Deseja excluir esse registo?','Apagando...',MB_YESNO+MB_ICONQUESTION)=ID_YES) then
  begin
    with dm.SQL1 do
    begin
      close;
      sql.clear;
      sql.Add('Delete from tbdependente where codigo=:c0');
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

procedure TFDependentes.Bt_PriClick(Sender: TObject);
begin
  dm.SQL1.First;
  Mostrar_Dados;
end;

procedure TFDependentes.Bt_AntClick(Sender: TObject);
begin
  dm.SQL1.Prior;
  Mostrar_Dados;
end;

procedure TFDependentes.Bt_ProxClick(Sender: TObject);
begin
  dm.SQL1.Next;
  Mostrar_Dados;
end;

procedure TFDependentes.Bt_UltClick(Sender: TObject);
begin
  dm.SQL1.Last;
  Mostrar_Dados;
end;

end.
