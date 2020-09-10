unit UAti_Soc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFAti_soc = class(TForm)
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
    Bt_alt: TBitBtn;
    Bt_Apa: TBitBtn;
    BitBtn5: TBitBtn;
    Bt_Prim: TBitBtn;
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

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAti_soc: TFAti_soc;

implementation

uses UPrincipal;

{$R *.dfm}



end.
