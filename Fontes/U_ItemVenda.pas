unit U_ItemVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask;

type
  TF_ItemVenda = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    btn_inserir: TBitBtn;
    btn_cancelar: TBitBtn;
    DBText1: TDBText;
    DBText2: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ItemVenda: TF_ItemVenda;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_ItemVenda.DBEdit3Exit(Sender: TObject);
begin
  DM.TB_ItemVendaTOTAL.AsFloat := DM.TB_ItemVendaQUANTIDADE.AsInteger *
    DM.TB_ItemVendaVALOR.AsFloat;
end;

procedure TF_ItemVenda.DBLookupComboBox1Exit(Sender: TObject);
begin
  DM.TB_ItemVendaVALOR.AsFloat := DM.TB_ProdutoPRECOVENDA.AsFloat;
end;

end.
