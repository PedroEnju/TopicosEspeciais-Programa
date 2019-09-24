unit U_ItemCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Buttons;

type
  TF_ItemCompra = class(TForm)
    btn_cancelar: TBitBtn;
    btn_inserir: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    DBText3: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ItemCompra: TF_ItemCompra;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_ItemCompra.btn_cancelarClick(Sender: TObject);
begin
  DM.TB_Compra.Cancel;
  Close;
end;

procedure TF_ItemCompra.btn_inserirClick(Sender: TObject);
begin
  DM.TB_ItemCompra.Post;
  DM.TB_ItemCompra.Refresh;
  Close;
end;

procedure TF_ItemCompra.DBEdit3Exit(Sender: TObject);
begin

  if (StrToInt(DBEdit3.Text) <= 0) then
    ShowMessage('Quantidade de produto da Compra é necessário ser maior que 0!');

  DM.TB_ItemCompraTOTAL.AsFloat := DM.TB_ItemCompraQUANTIDADE.AsInteger *
    DM.TB_ItemCompraVALOR.AsFloat;
end;

procedure TF_ItemCompra.DBLookupComboBox1Exit(Sender: TObject);
begin
  DM.TB_ItemCompraVALOR.AsFloat := DM.TB_ProdutoPRECOCUSTO.AsFloat;
end;

end.
