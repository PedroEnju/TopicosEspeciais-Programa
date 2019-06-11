unit U_Cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrameButton, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TF_Cidade = class(TForm)
    Frame_Button1: TFrame_Button;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    DBText1: TDBText;
    DBComboBox1: TDBComboBox;
    procedure Frame_Button1btnFecharClick(Sender: TObject);
    procedure Frame_Button1btnFirstClick(Sender: TObject);
    procedure Frame_Button1btnPreviousClick(Sender: TObject);
    procedure Frame_Button1btnNextClick(Sender: TObject);
    procedure Frame_Button1btnLastClick(Sender: TObject);
    procedure Frame_Button1btnNovoClick(Sender: TObject);
    procedure Frame_Button1btnEditarClick(Sender: TObject);
    procedure Frame_Button1btnSalvarClick(Sender: TObject);
    procedure Frame_Button1btnExcluirClick(Sender: TObject);
    procedure Frame_Button1btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cidade: TF_Cidade;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_Cidade.Frame_Button1btnCancelarClick(Sender: TObject);
begin
  Frame_Button1.btnCancelarClick(Sender);
  DM.TB_Cidade.Cancel;
end;

procedure TF_Cidade.Frame_Button1btnEditarClick(Sender: TObject);
begin
  Frame_Button1.btnEditarClick(Sender);
  DM.TB_Cidade.Edit;
end;

procedure TF_Cidade.Frame_Button1btnExcluirClick(Sender: TObject);
begin
  Frame_Button1.btnExcluirClick(Sender);

  if DM.TB_Cidade.RecordCount = 0 then
    ShowMessage('Tabela vazia!')
  else if DM.TB_Cliente.Locate('idCidade', DM.TB_Cidade.FieldByName('idCidade')
    .AsInteger, []) then
    ShowMessage
      ('Esta Cidade possui rela��o com outra tabela e n�o pode ser exclu�do!,' +
      #13 + 'Por favor realoc�-lo antes de deletar.')
  else if DM.TB_Fornecedor.Locate('idCidade',
    DM.TB_Cidade.FieldByName('idCidade').AsInteger, []) then
    ShowMessage
      ('Esta Cidade possui rela��o com outra tabela e n�o pode ser exclu�do!,' +
      #13 + 'Por favor realoc�-lo antes de deletar.')
  else if DM.TB_Funcionario.Locate('idCidade',
    DM.TB_Cidade.FieldByName('idCidade').AsInteger, []) then
    ShowMessage
      ('Esta Cidade possui rela��o com outra tabela e n�o pode ser exclu�do!,' +
      #13 + 'Por favor realoc�-lo antes de deletar.')
  else if MessageDLG('Tem certeza que deseja remover a Cidade: ' + #13 +
    DM.TB_Cidade.FieldByName('nomeCidade').AsString + ' ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    DM.TB_Cidade.Delete;

end;

procedure TF_Cidade.Frame_Button1btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Cidade.Frame_Button1btnFirstClick(Sender: TObject);
begin
  DM.TB_Cidade.First;
end;

procedure TF_Cidade.Frame_Button1btnLastClick(Sender: TObject);
begin
  DM.TB_Cidade.Last;
end;

procedure TF_Cidade.Frame_Button1btnNextClick(Sender: TObject);
begin
  DM.TB_Cidade.Next;
end;

procedure TF_Cidade.Frame_Button1btnNovoClick(Sender: TObject);
begin
  Frame_Button1.btnNovoClick(Sender);
  DM.TB_Cidade.Insert;
end;

procedure TF_Cidade.Frame_Button1btnPreviousClick(Sender: TObject);
begin
  DM.TB_Cidade.Prior;
end;

procedure TF_Cidade.Frame_Button1btnSalvarClick(Sender: TObject);
begin

  if (DBEdit2.Text <> EmptyStr) then
  begin
    if (DBComboBox1.Text <> EmptyStr) then
    begin
      if ((DBComboBox1.Text = 'A') or (DBComboBox1.Text = 'I')) then
      begin
        Frame_Button1.btnSalvarClick(Sender);
        DM.TB_Cidade.Post;
      end
      else
      begin
        ShowMessage('Status incorreto! Por favor verifique!');
        DBComboBox1.SetFocus;
      end;
    end
    else
    begin
      ShowMessage('Status � um campo obrigat�rio! Por favor verifique!');
      DBComboBox1.SetFocus;
    end;
  end
  else
  begin
    ShowMessage('Nome da Cidade � um campo obrigat�rio! Por favor verifique!');
    DBEdit2.SetFocus;
  end;
end;

end.
