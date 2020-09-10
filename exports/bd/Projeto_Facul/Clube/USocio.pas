unit USocio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DateUtils;

type
  TFSocio = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edt_Cod: TEdit;
    Label2: TLabel;
    Edt_Desc: TEdit;
    GroupBox2: TGroupBox;
    Edt_End: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edt_Bai: TEdit;
    Label5: TLabel;
    Edt_Cep: TEdit;
    Label6: TLabel;
    Edt_Est: TEdit;
    Label7: TLabel;
    Edt_Tel: TEdit;
    Label8: TLabel;
    Edt_Cel: TEdit;
    Label9: TLabel;
    Edt_CPF: TEdit;
    Label10: TLabel;
    Edt_RG: TEdit;
    Label11: TLabel;
    Edt_Comp: TEdit;
    Bt_Nov: TBitBtn;
    Bt_Sal: TBitBtn;
    Bt_Alt: TBitBtn;
    Bt_Apa: TBitBtn;
    Bt_Fec: TBitBtn;
    Bt_Pri: TBitBtn;
    Bt_Ant: TBitBtn;
    Bt_Prox: TBitBtn;
    Bt_Ult: TBitBtn;
    Label12: TLabel;
    Edt_Eci: TEdit;
    Label13: TLabel;
    Edt_Nasc: TEdit;
    Label14: TLabel;
    Edt_Cid: TEdit;
    Label15: TLabel;
    Edt_Ida: TEdit;
    StatusBar1: TStatusBar;
    Bt_Can: TBitBtn;
    function Verificar_Dados: Boolean;
    procedure Mostrar_Dados();
    procedure Buscar_Dados();
    procedure Limpar_Edits();
    {procedure Carrega_Combo();  }
    procedure GerenciarBotoes(opc: Boolean);
    procedure GerenciarEdits(opc: Boolean);
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
    procedure Edt_NascExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSocio: TFSocio;
  codigo: string ;
implementation

uses UPrincipal, UDM, DB, IBQuery;

{$R *.dfm}

{ TFSocio }

procedure TFSocio.GerenciarBotoes(opc: Boolean);
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

procedure TFSocio.GerenciarEdits(opc: Boolean);
begin
    Edt_Cod.Enabled := opc;
    Edt_Desc.Enabled  := opc;
    Edt_Bai.Enabled  := opc;
    Edt_CEP.Enabled:= opc;
    Edt_Comp.Enabled := opc;
    Edt_Cid.Enabled := opc;
    Edt_End.Enabled := opc;
    Edt_Est.Enabled := opc;
    Edt_Tel.Enabled:= opc;
    Edt_Cel.Enabled := opc;
    Edt_CPF.Enabled := opc;
    Edt_RG.Enabled := opc;
    Edt_Comp.Enabled := opc;
    Edt_Eci.Enabled := opc;
    Edt_Nasc.Enabled := opc;
    Edt_Ida.Enabled := opc;
end;

procedure TFSocio.Limpar_Edits;
begin
    Edt_Cod.Text := '';
    Edt_Desc.Text:= '';
    Edt_Bai.Text := '';
    Edt_CEP.Text := '';
    Edt_Comp.Text:= '';
    Edt_Cid.Text := '';
    Edt_End.Text := '';
    Edt_Est.Text := '';
    Edt_Tel.Text := '';
    Edt_Cel.Text := '';
    Edt_CPF.Text := '';
    Edt_RG.Text  := '';
    Edt_Comp.Text:= '';
    Edt_Eci.Text := '';
    Edt_Nasc.Text:= '';
    Edt_Ida.Text := '';
end;

procedure TFSocio.Mostrar_Dados;
begin
   with dm.SQL1 do
  begin
    Edt_Cod.Text := Fields [0].AsString;
    Edt_Desc.Text := Fields[1].AsString;
    Edt_End.Text := Fields[2].AsString;
    Edt_Comp.Text := Fields[3].AsString;
    Edt_Bai.Text := Fields[4].AsString;
    Edt_Cid.Text := Fields[5].AsString;
    Edt_CEP.Text := Fields[6].AsString;
    Edt_Est.Text := Fields[7].AsString;
    Edt_CPF.Text := Fields[8].AsString;
    Edt_RG.Text := Fields[9].AsString;
    Edt_Tel.Text := Fields[10].AsString;
    Edt_Cel.Text := Fields[11].AsString;
    Edt_Nasc.Text := Fields[12].AsString;
    Edt_Ida.Text := Fields[13].AsString;
    Edt_Eci.Text := Fields[14].AsString;
  end;
end;

function TFSocio.Verificar_Dados: Boolean;
begin
   Verificar_Dados := true;
   if Edt_Desc.Text = '' then
    begin
     Application.MessageBox('Informe a Descrição do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
     Edt_Desc.SetFocus;
     Verificar_Dados := false;
     exit;
    end;
   if Edt_End.Text  = '' then
    begin
     Application.MessageBox('Informe o Endereço do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
     Edt_End.SetFocus;
     Verificar_Dados := false;
    end;
   if Edt_Bai.Text = '' then
    begin
      Application.MessageBox('Informe o Bairro do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Bai.SetFocus;
      Verificar_Dados := false;
    end;
   if Edt_Cep.Text = '' then
    begin
      Application.MessageBox('Informe o CEP do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Cep.SetFocus;
      Verificar_Dados := false;
    end;
   if Edt_Est.Text = '' then
    begin
      Application.MessageBox('Informe o Estado do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Est.SetFocus;
      Verificar_Dados := false;
    end;
   if Edt_Tel.Text = '' then
    begin
      Application.MessageBox('Informe o Telefone do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Tel.SetFocus;
      Verificar_Dados := false;
    end;
   if Edt_Cel.Text = '' then
    begin
      Application.MessageBox('Informe o Celular do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Cel.SetFocus;
      Verificar_Dados := false;
    end;
   if Edt_CPF.Text = '' then
    begin
      Application.MessageBox('Informe o CPF do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_CPF.SetFocus;
      Verificar_Dados := false;
    end;
   if Edt_RG.Text = '' then
    begin
      Application.MessageBox('Informe o RG do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_RG.SetFocus;
      Verificar_Dados := false;
    end;
   {if Edt_Comp.Text = '' then
    begin
      Application.MessageBox('Informe o Complemento do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Comp.SetFocus;
      Verificar_Dados := false;
    end; }
   if Edt_Eci.Text = '' then
    begin
      Application.MessageBox('Informe o Estado Civil do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Eci.SetFocus;
      Verificar_Dados := false;
    end;
   if Edt_Nasc.Text = '' then
    begin
      Application.MessageBox('Informe a Data de Nascimento do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Nasc.SetFocus;
      Verificar_Dados := false;
    end;
   if Edt_Cid.Text = '' then
    begin
      Application.MessageBox('Informe a Cidade do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Cid.SetFocus;
      Verificar_Dados := false;
    end;
   if Edt_Ida.Text = '' then
    begin
      Application.MessageBox('Informe a Idade do Sócio!','Campo Obrigatório',MB_OK+MB_ICONERROR);
      Edt_Ida.SetFocus;
      Verificar_Dados := false;
    end;
end;

procedure TFSocio.FormShow(Sender: TObject);
begin
  dm.BD.Connected := true;
  dm.TRANS.Active := true;
  Buscar_Dados;
  Mostrar_Dados;
  GerenciarEdits(false);
  GerenciarBotoes(true);

  bt_fec.SetFocus;
end;

procedure TFSocio.Bt_FecClick(Sender: TObject);
begin
  FSocio.Close;
end;

procedure TFSocio.Buscar_Dados;
begin
  with dm.SQL1 do
  begin
    sql.Clear;
    sql.Add('select * from tbsocio order by descricao');
    prepare;
    open;
  end;
end;

procedure TFSocio.Bt_NovClick(Sender: TObject);
begin
  codigo := Edt_Cod.Text;
  GerenciarEdits(True);
  Limpar_Edits;
  GerenciarBotoes(false);
  Edt_Desc.SetFocus;
  FSocio.Caption := 'Incluindo Novo Sócio';
end;

procedure TFSocio.Bt_SalClick(Sender: TObject);
begin
    if Verificar_Dados then
  begin
    if FSocio.Caption= 'Incluindo Novo Sócio'then
      begin
        with dm.SQL1 do
         begin
          close;
          sql.Clear;
          sql.Add('insert into tbsocio values(null, :c1, :c2, :c3, :c4, :c5, :c6, :c7, :c8, :c9, :c10, :c11, :c12, :c13, :c14)');
          ParamByName('c1').Value := Edt_Desc.Text;
          ParamByName('c2').Value := Edt_End.Text;
          ParamByName('c3').Value := Edt_Comp.Text;
          ParamByName('c4').Value := Edt_Bai.Text;
          ParamByName('c5').Value := Edt_Cid.Text;
          ParamByName('c6').Value := Edt_CEP.Text;
          ParamByName('c7').Value := Edt_Est.Text;
          ParamByName('c8').Value := Edt_CPF.Text;
          ParamByName('c9').Value := Edt_RG.Text ;
          ParamByName('c10').Value := Edt_Tel.Text;
          ParamByName('c11').Value := Edt_Cel.Text;
          ParamByName('c12').Value := Edt_Nasc.Text;
          ParamByName('c13').Value := Edt_Ida.Text;
          ParamByName('c14').Value := Edt_Eci.Text;
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
          sql.Add('Update tbsocio set descricao=:c1, endereco=:c2, compl=:c3, bairro=:c4, cidade=:c5, cep=:c6, estado=:c7, cpf=:c8, rg=:c9, tel_res=:c10, tel_cel=:c11, dt_nasc=:c12, ida=:c13, est_civ=:c14 where codigo=:c0');
          ParamByName('c0').Value := Edt_Cod.Text;
          ParamByName('c1').Value := Edt_Desc.Text;
          ParamByName('c2').Value := Edt_End.Text;
          ParamByName('c3').Value := Edt_Comp.Text;
          ParamByName('c4').Value := Edt_Bai.Text;
          ParamByName('c5').Value := Edt_Cid.Text;
          ParamByName('c6').Value := Edt_CEP.Text;
          ParamByName('c7').Value := Edt_Est.Text;
          ParamByName('c8').Value := Edt_CPF.Text;
          ParamByName('c9').Value := Edt_RG.Text ;
          ParamByName('c10').Value := Edt_Tel.Text;
          ParamByName('c11').Value := Edt_Cel.Text;
          ParamByName('c12').Value := Edt_Nasc.Text;
          ParamByName('c13').Value := Edt_Ida.Text;
          ParamByName('c14').Value := Edt_Eci.Text;
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
    FSocio.Caption := 'Cadastro de Sócios';
    Buscar_Dados;
    Mostrar_Dados;
  end;
end;


procedure TFSocio.Bt_AltClick(Sender: TObject);
begin
  codigo := Edt_Cod.Text;
  GerenciarEdits(True);
  GerenciarBotoes(false);
  FSocio.Caption := 'Alterando dados do Sócio';
  Edt_Desc.SetFocus;
end;

procedure TFSocio.Bt_CanClick(Sender: TObject);
begin
//   codigo:=Edt_cod.Text;
//   {Recebe o código do Sócio que estávamos anteriormente, para podermos
//   voltar no registro antigo}
     GerenciarEdits(False);
     GerenciarBotoes(true);
     FSocio.Caption := 'Cadastro de Sócio';
     Bt_Nov.SetFocus;
     dm.SQL1.Locate('Codigo', VarArrayOf([codigo]),[]);
     Mostrar_Dados;
end;

procedure TFSocio.Bt_ApaClick(Sender: TObject);
begin
  if(application.MessageBox('Deseja excluir esse registo?','Apagando...',MB_YESNO+MB_ICONQUESTION)=ID_YES) then
  begin
    with dm.SQL1 do
    begin
      close;
      sql.clear;
      sql.Add('Delete from tbsocio where codigo=:c0');
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

procedure TFSocio.Bt_PriClick(Sender: TObject);
begin
  dm.SQL1.First;
  Mostrar_Dados;
end;

procedure TFSocio.Bt_AntClick(Sender: TObject);
begin
  dm.SQL1.Prior;
  Mostrar_Dados;
end;

procedure TFSocio.Bt_ProxClick(Sender: TObject);
begin
  dm.SQL1.Next;
  Mostrar_Dados;

end;

procedure TFSocio.Bt_UltClick(Sender: TObject);
begin
  dm.SQL1.Last;
  Mostrar_Dados;
end;

{
procedure TFSocio.Carrega_Combo;
begin
  with dm.SQL2 do
  begin
    sql.Clear;
    sql.Add('select * from tbdependente order by descricao');
    prepare;
    open;
  end;
end;    }

procedure TFSocio.Edt_NascExit(Sender: TObject);
begin
  if Edt_Nasc.Text <> '' then
  begin
    Edt_Ida.Text := Inttostr(YearOf(date() - strtodate(edt_nasc.Text))-1900);
  end;
end;

end.
