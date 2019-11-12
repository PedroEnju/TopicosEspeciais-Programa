unit U_PagarParcela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btn_cancelar: TBitBtn;
    btn_salvar: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    btn_novoItem: TBitBtn;
    btn_salvarItem: TBitBtn;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBText3: TDBText;
    DBText2: TDBText;
    DBText1: TDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses U_DM;

end.
