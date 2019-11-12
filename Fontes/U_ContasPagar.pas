unit U_ContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, U_FrameButton, Vcl.Menus;

type
  TF_ContasPagar = class(TForm)
    Frame_Button1: TFrame_Button;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    DB: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    DBText2: TDBText;
    PopupMenu1: TPopupMenu;
    ReceberParcela1: TMenuItem;
    RecalcularParcela1: TMenuItem;
    Sair1: TMenuItem;
    procedure ReceberParcela1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ContasPagar: TF_ContasPagar;

implementation

{$R *.dfm}

uses U_DM, U_Funcao;

procedure TF_ContasPagar.ReceberParcela1Click(Sender: TObject);
begin
  RecalcularParcelaPag;
  if DM.TB_ParcelaContasPagar.RecordCount = 0 then
    exit;
  if DM.TB_ContasPagarSTATUSCONTA.AsString = 'S' Then
  begin
    ShowMessage('Não existem parcelas a pagar');
    exit;
  end;
  if DM.TB_ParcelaContasPagarSTATUSPARCELA.AsString = 'S' Then
  begin
    ShowMessage('Parcela já paga');
    exit;
  end;
  DM.TB_ParcelaContasPagar.Edit;
  DM.TB_ParcelaContasPagarDATAVENCIMENTO.AsDateTime := Date;
  CriarForm(F_PagarParcela, TF_PagarParcela, '');
  AbrirDestruirForm(F_PagarParcela);
end;

end.
