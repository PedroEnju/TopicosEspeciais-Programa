unit U_ValorParcelaReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TF_ValorParcelaReceber = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    btn_cancelar: TButton;
    btn_salvar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ValorParcelaReceber: TF_ValorParcelaReceber;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_ValorParcelaReceber.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TF_ValorParcelaReceber.FormShow(Sender: TObject);
begin
  With DM.TB_Recebimento do
  begin
    if Active = False then
      Open;
    Append;
    FieldByName('ValorRecebido').AsFloat :=
      DM.TB_ParcelaContasRecebervalorreceber.AsFloat -
      DM.TB_ParcelaContasRecebervalorrecebido.AsFloat;
    FieldByName('DATARECEBIMENTO').AsDateTime := Date;

  end;
end;

end.
