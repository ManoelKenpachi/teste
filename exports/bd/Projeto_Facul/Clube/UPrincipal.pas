unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, XPMan;

type
  TFPrincipal = class(TForm)
    MM_Principal: TMainMenu;
    Cadastro1: TMenuItem;
    Socio1: TMenuItem;
    Dependente1: TMenuItem;
    Consulta1: TMenuItem;
    Atividade2: TMenuItem;
    Sair1: TMenuItem;
    Timer1: TTimer;
    StatusBar: TStatusBar;
    XPManifest1: TXPManifest;
    procedure Sair1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure socio1Click(Sender: TObject);
    procedure Dependente1Click(Sender: TObject);
    procedure Atividade2Click(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    function mostrahora:string;
    function mostradata:string;
    procedure ApplicationEvents1Hint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;
  var
   presente:tdatetime;
   ano,mes,dia:word;
implementation

uses USocio, UDependente, UAtividade, UConsulta;

{$R *.dfm}

procedure TFPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFPrincipal.Timer1Timer(Sender: TObject);
begin
  FlashWindow(Handle, true);
  //FlashWindow(Application.Handle, true);
  presente:=now;
  decodedate(presente,ano,mes,dia);
  case mes of
    1:StatusBar.Panels[1].TEXT:=' JANEIRO '+inttostr(ano);
    2:StatusBar.Panels[1].TEXT:='FEVEREIRO'+inttostr(ano);
    3:StatusBar.Panels[1].TEXT:='MAR�O '+inttostr(ano);
    4:StatusBar.Panels[1].TEXT:='ABRIL '+inttostr(ano);
    5:StatusBar.Panels[1].TEXT:='MAIO '+inttostr(ano);
    6:StatusBar.Panels[1].TEXT:='JUNHO '+inttostr(ano);
    7:StatusBar.Panels[1].TEXT:='JULHO '+inttostr(ano);
    8:StatusBar.Panels[1].TEXT:='AGOSTO '+inttostr(ano);
    9:StatusBar.Panels[1].TEXT:='SETEMBRO '+inttostr(ano);
    10:StatusBar.Panels[1].TEXT:='OUTUBRO '+inttostr(ano);
    11:StatusBar.Panels[1].TEXT:='NOVEMBRO '+inttostr(ano);
    12:StatusBar.Panels[1].TEXT:='DEZEMBRO '+inttostr(ano);
end;
   StatusBar.Panels[2].TEXT:=mostrahora();
   StatusBar.Panels[1].TEXT:=mostradata();
   StatusBar.Panels[0].Text := 'Projeto Final " Faculdade Logatti " ';
   {StatusBar.Panels[1].Text := datetostr(date);
   StatusBar.Panels[2].Text := timetostr(time);   }

end;

procedure TFPrincipal.socio1Click(Sender: TObject);
begin
  Application.CreateForm(TFSocio,FSocio);
  FSocio.ShowModal;
  FSocio.Destroy;
end;

procedure TFPrincipal.Dependente1Click(Sender: TObject);
begin
  Application.CreateForm(TFDependentes,FDependentes);
  FDependentes.ShowModal;
  FDependentes.Destroy;
end;

procedure TFPrincipal.Atividade2Click(Sender: TObject);
begin
  Application.CreateForm(TFAtividade,FAtividade);
  FAtividade.ShowModal;
  FAtividade.Destroy;
end;

procedure TFPrincipal.Consulta1Click(Sender: TObject);
begin
  Application.CreateForm(TFConsulta,FConsulta);
  FConsulta.ShowModal;
  FConsulta.Destroy;
end;

function TFPrincipal.mostrahora: string;
begin
  mostrahora:=timetostr(time);
end;
function TFPrincipal.mostradata:string;
var
  dthoje:tdatetime;
  diasemana:integer;
  strdiasemana:string;
begin
  dthoje:=date;
  diasemana:=dayofweek(dthoje);
  case diasemana of
      1:strdiasemana:='Domingo';
      2:strdiasemana:='Segunda-feira';
      3:strdiasemana:='Ter�a-feira';
      4:strdiasemana:='Quarta-feira';
      5:strdiasemana:='Quinta-feira';
      6:strdiasemana:='Sexta-feira';
      7:strdiasemana:='S�bado';
end;
  mostradata:=strdiasemana+' '+datetostr(dthoje);
end;

procedure TFPrincipal.ApplicationEvents1Hint(Sender: TObject);
begin
  StatusBar.Panels[2].Text:=Application.Hint;
end;

end.
