program PClube;



uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  USocio in 'USocio.pas' {FSocio},
  UDependente in 'UDependente.pas' {FDependentes},
  UAtividade in 'UAtividade.pas' {FAtividade},
  UConsulta in 'UConsulta.pas' {FConsulta},
  UDM in 'UDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFSocio, FSocio);
  Application.CreateForm(TFDependentes, FDependentes);
  Application.CreateForm(TFAtividade, FAtividade);
  Application.CreateForm(TFConsulta, FConsulta);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
