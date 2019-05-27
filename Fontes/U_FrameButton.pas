unit U_FrameButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrame_Button = class(TFrame)
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    btnFechar: TBitBtn;
    btnLast: TBitBtn;
    btnNext: TBitBtn;
    btnPrevious: TBitBtn;
    btnFirst: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure buttonsOptionOne;
    procedure buttonsOptionTwo;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrame_Button.btnCancelarClick(Sender: TObject);
begin
  buttonsOptionTwo;
end;

procedure TFrame_Button.btnEditarClick(Sender: TObject);
begin
  buttonsOptionOne;
end;

procedure TFrame_Button.btnExcluirClick(Sender: TObject);
begin
  buttonsOptionTwo;
end;

procedure TFrame_Button.btnNovoClick(Sender: TObject);
begin
  buttonsOptionOne;
end;

procedure TFrame_Button.btnSalvarClick(Sender: TObject);
begin
  buttonsOptionTwo;
end;

procedure TFrame_Button.buttonsOptionOne;
begin
  btnNovo.Enabled := false;
  btnEditar.Enabled := false;
  btnSalvar.Enabled := true;
  btnExcluir.Enabled := false;
  btnCancelar.Enabled := true;
  btnFechar.Enabled := false;
end;

procedure TFrame_Button.buttonsOptionTwo;
begin
  btnNovo.Enabled := true;
  btnEditar.Enabled := true;
  btnSalvar.Enabled := false;
  btnExcluir.Enabled := true;
  btnCancelar.Enabled := false;
  btnFechar.Enabled := true;
end;

end.
