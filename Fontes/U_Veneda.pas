unit U_Veneda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrameButton, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TF_Venda = class(TForm)
    Frame_Button1: TFrame_Button;
    pVenda: TPanel;
    pItVenda: TPanel;
    pResultado: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    btExcluirItem: TBitBtn;
    btAlterarItem: TBitBtn;
    btNovoitem: TBitBtn;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    btFinalizar: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Venda: TF_Venda;

implementation

{$R *.dfm}

uses U_Cidade, U_Cliente, U_DM, U_Fornecedor, U_Funcionario, U_Menu,
  U_PesquisaCidade, U_PesquisaCliente, U_PesquisaFornecedor, U_Produto;

end.
