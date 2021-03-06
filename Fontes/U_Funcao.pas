unit U_Funcao;

interface

Uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, ExtCtrls, U_FrameButton, ComCtrls, DBCtrls,
  StdCtrls, Mask, Buttons, db, DateUtils, IniFiles;

procedure FormPadrao(nomeForm: TForm);
procedure CriarForm(var varForm; varInstance: TFormClass; varParam: String);
procedure AbrirDestruirForm(var varForm);
procedure DestruirForm(var varForm: TForm);
procedure AbrirDestruirFormAcesso(var varForm; varInstance: TFormClass);
procedure AbrirForm(InstanceClass: TComponentClass; nomeForm: TForm);
procedure InserirMovimentoCaixa(varHistorico: String;
  varCodRecebTo, varCodPagTo: Integer; varValorEntrada, varValorSaida: Real;
  NomeTipoDoc: String);
procedure RecalcularParcelaRec;
function ConsultaDependencia(Campo, valorcampo, tabela, msg: String): Boolean;
function ArredondaValor(varValor: Real; varCasaDecimal: Integer): Real;

procedure InserirContRec(CodCli: Integer; TipoConta: String; TotalVenda: Real;
  CodConta: Integer);
procedure InserirContPag(CodForn: Integer; TipoConta: String; TotalCompra: Real;
  CodConta, CodFunc: Integer);

procedure InserirParcelaContPag(NParcela: Real; DataVencimento: TDateTime;
  ValorParcela: Real; Status: String);
procedure InserirParcelaContRec(NParcela: Real; DataVencimento: TDateTime;
  ValorParcela: Real; Status: String);

procedure InserirPagamento(ValorPago: Real; DataPago, HoraPago: TDateTime;
  CodTipoDoc: Integer; NomeTipoDoc: String);
procedure InserirRecebimento(ValorRecebido: Real;
  DataRecebido, HoraRecebido: TDateTime; CodTipoDoc: Integer;
  TipoVenda: String);

function SaldoCaixa(CodCaixa: Integer): Real;
function BuscarCodCaixa: Integer;
function AtivarStatus(Codigo, tabela, Campo, Status: String): Boolean;
procedure RecalcularParcelaPag;
procedure VerificarAcesso(CodFunc, nomeForm: String);
procedure inserirvenda(CodCli, CodFunc, CodTipo: Integer; TipoVenda: String;
  out CodVenda: Integer);
procedure InserirItVenda(CodPro: Integer; QtItVenda, PrItVenda: Real);
function BuscarRegistro(CampoEnvio: String; ValorEnviado: String;
  CampoRetorno: String; NomeTabela: String): String;
function TrocarDataStr(varData: String): String;
function ValidaCPF(Num: STring): Boolean;
function ValidaCNPJ(Num: STring): Boolean;
function CalculaDigEAN13(Cod: String): Boolean;
function CheckSumModulo10(const data: string): string;
function PreencherCaracteresEsquerda(Texto, Tipo: String;
  Tamanho: Integer): String;
function PreencherEspacos(Texto, Tipo: String; Tamanho: Integer): String;
procedure AvancarTab(var varKey: Char; varForm: TForm);

var
  CodVendaNovo: Integer;
  vlrTotalParcela: Real;
  ArqIni: tIniFile;
  tecla: Char;
  Abrir, MesaFicha, CaminhoEXE: String;

implementation

uses U_DM, U_Menu;

var
  ContadorDeDias: Integer;

procedure AvancarTab(var varKey: Char; varForm: TForm);
begin
  varKey := #0;
  varForm.Perform(WM_NextDlgCtl, 0, 0);
end;

function PreencherEspacos(Texto, Tipo: String; Tamanho: Integer): String;
var
  TamanhoTeste: Integer;
  Numero: String;
begin
  TamanhoTeste := Length(Texto);

  While TamanhoTeste < Tamanho do
  begin
    If Tipo = 'N' then
      Numero := Numero + '0';

    If Tipo = 'X' then
      Texto := Texto + ' ';

    TamanhoTeste := TamanhoTeste + 1;
  end;

  If Tipo = 'N' then
    Result := Numero + Texto;

  If Tipo = 'X' then
    Result := Texto;

end;

function PreencherCaracteresEsquerda(Texto, Tipo: String;
  Tamanho: Integer): String;
var
  TamanhoTeste: Integer;
  Numero: String;
begin
  TamanhoTeste := Length(Texto);
  Result := '';

  While TamanhoTeste < Tamanho do
  begin
    If Tipo = 'N' then
      Numero := '0' + Numero;

    If Tipo = 'X' then
      Texto := ' ' + Texto;

    If Tipo = '-' then
      Texto := '-' + Texto;

    If Tipo = '.' then
      Texto := '.' + Texto;

    TamanhoTeste := TamanhoTeste + 1;
  end;

  If Tipo = 'N' then
    Result := Numero + Texto;

  If ((Tipo = 'X') or (Tipo = '-')) or (Tipo = '.') then
    Result := Texto;
end;

function CheckSumModulo10(const data: string): string;
var
  i, fak, sum: Integer;
begin
  sum := 0;
  fak := Length(data);
  for i := 1 to Length(data) do
  begin
    if (fak mod 2) = 0 then
      sum := sum + (StrToInt(data[i]) * 1)
    else
      sum := sum + (StrToInt(data[i]) * 3);
    dec(fak);
  end;
  if (sum mod 10) = 0 then
    Result := data + '0'
  else
    Result := data + IntToStr(10 - (sum mod 10));
end;

function CalculaDigEAN13(Cod: String): Boolean;
  function Par(Cod: Integer): Boolean;
  begin
    Result := Cod Mod 2 = 0;
  end;

var
  i, SomaPar, SomaImpar: Integer;
  Resultado, Digito: String;
begin
  SomaPar := 0;
  SomaImpar := 0;
  Digito := copy(Cod, 13, 1);
  for i := 1 to 12 do
    if Par(i) then
      SomaPar := SomaPar + StrToInt(Cod[i])
    else
      SomaImpar := SomaImpar + StrToInt(Cod[i]);
  SomaPar := SomaPar * 3;
  i := 0;
  while i < (SomaPar + SomaImpar) do
    Inc(i, 10);
  Resultado := IntToStr(i - (SomaPar + SomaImpar));
  If Resultado = Digito then
    Result := True
  else
    Result := False;
end;

{ Procedure TestarCaixa;
  begin
  If StatusCaixa=False then
  begin
  MessageDLG('Caixa est� fechado!',mtinformation,[mbok],0);
  Abort;
  end;
  end;

  Function StatusCaixa:Boolean;
  begin
  DM.TbCaixa.Refresh;
  If DM.TbCaixa.Locate('Status','ABERTO',[])=False Then
  Result := False
  else
  Result := true;
  end; }

function ValidaCNPJ(Num: STring): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: Integer;
  d1, d2: Integer;
  digitado, calculado: string;
begin

  Num := trim(Num);
  If Length(Num) = 0 then
    Result := True
  else If Length(Num) <> 14 Then
    Result := False
  else If (Num = '00000000000000') or (Num = '11111111111111') or
    (Num = '22222222222222') or (Num = '33333333333333') or
    (Num = '44444444444444') or (Num = '55555555555555') or
    (Num = '66666666666666') or (Num = '77777777777777') or
    (Num = '88888888888888') or (Num = '99999999999999') then
    Result := False
  else
  begin
    n1 := StrToInt(Num[1]);
    n2 := StrToInt(Num[2]);
    n3 := StrToInt(Num[3]);
    n4 := StrToInt(Num[4]);
    n5 := StrToInt(Num[5]);
    n6 := StrToInt(Num[6]);
    n7 := StrToInt(Num[7]);
    n8 := StrToInt(Num[8]);
    n9 := StrToInt(Num[9]);
    n10 := StrToInt(Num[10]);
    n11 := StrToInt(Num[11]);
    n12 := StrToInt(Num[12]);
    d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 *
      9 + n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 *
      9 + n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    calculado := IntToStr(d1) + IntToStr(d2);
    digitado := Num[13] + Num[14];
    if calculado <> digitado then
      Result := False
    else
      Result := True;
  end;
end;

function ValidaCPF(Num: STring): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: Integer;
  d1, d2: Integer;
  digitado, calculado: string;
begin

  Num := (trim(Num));
  If Length(Num) = 0 Then
    Result := True
  else If Length(Num) <> 11 Then
    Result := False
  else If (Num = '00000000000') or (Num = '11111111111') or
    (Num = '22222222222') or (Num = '33333333333') or (Num = '44444444444') or
    (Num = '55555555555') or (Num = '66666666666') or (Num = '77777777777') or
    (Num = '88888888888') or (Num = '99999999999') then
    Result := False
  else
  begin
    n1 := StrToInt(Num[1]);
    n2 := StrToInt(Num[2]);
    n3 := StrToInt(Num[3]);
    n4 := StrToInt(Num[4]);
    n5 := StrToInt(Num[5]);
    n6 := StrToInt(Num[6]);
    n7 := StrToInt(Num[7]);
    n8 := StrToInt(Num[8]);
    n9 := StrToInt(Num[9]);
    d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9
      + n1 * 10;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9
      + n2 * 10 + n1 * 11;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    calculado := IntToStr(d1) + IntToStr(d2);
    digitado := Num[10] + Num[11];
    if calculado <> digitado then
      Result := False
    else
      Result := True;
  end;
end;

function TrocarDataStr(varData: String): String;
begin
  Result := copy(varData, 4, 3) + copy(varData, 1, 3) + copy(varData, 7, 4);
end;

function BuscarRegistro(CampoEnvio: String; ValorEnviado: String;
  CampoRetorno: String; NomeTabela: String): String;
begin
  With DM.Query_Calcular do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ' + CampoRetorno + ' from ' + NomeTabela);
    SQL.Add('Where ' + CampoEnvio + ' like ' + #39 + ValorEnviado + '%' + #39);
    Open;
    if IsEmpty Then
    begin
      MessageDLG('Registro n�o encontrado', mtinformation, [mbok], 0);
      Abort;
    end
    else
      Result := Fields[0].AsString;
    Close;
  end;
end;

procedure InserirItVenda(CodPro: Integer; QtItVenda, PrItVenda: Real);
begin
  { With DM.TbVenda do
    begin
    Append;
    FieldByName('CodCli').AsInteger  := CodCli;
    end; }
end;

procedure inserirvenda(CodCli, CodFunc, CodTipo: Integer; TipoVenda: String;
  out CodVenda: Integer);
begin
  {
    With DM.TbVenda do
    begin
    Append;
    FieldByName('CodCli').AsInteger  := CodCli;
    FieldByName('CodFunc').AsInteger := CodFunc;
    FieldByName('CodTipo').AsInteger := CodTipo;
    FieldByName('TipoVenda').AsString:= TipoVenda;

    Post;
    CodVenda := FieldByName('CodVenda').AsInteger;
    end; }
end;

procedure DestruirForm(var varForm: TForm);
begin
  varForm.Free;
  varForm := nil;
end;

procedure VerificarAcesso(CodFunc, nomeForm: String);
begin
  { With DM.QuCalc do
    begin
    Close;
    SQL.Clear;
    SQL.Add('Select a.tipoacesso,b.descricaoform from AcessoFuncForm a, Formulario b');
    SQL.Add('where a.codform = b.codform and');
    SQL.Add('a.codfunc = :CodFunc and');
    SQL.Add('b.nomeform = :nomeform');
    ParamByName('CodFunc').AsString := CodFunc;
    ParamByName('nomeform').AsString:= UpperCase(NomeForm);
    Open;
    If not IsEmpty then
    If Fields[0].AsString='AB' then
    begin
    MessageDLG('"'+Fields[1].AsString+'" - Acesso n�o permitido', mtError, [mbok],0);
    Abort;
    end;
    Close;
    end; }
end;

procedure RecalcularParcelaPag;
begin
  { Dm.TbItContPag.Edit;
    If  StrToDate(Dm.TbItContPagDATAVENCIMENTO.AsString) < Date then
    begin
    ContadorDeDias :=
    DaysBetween(Date,Dm.TbItContPagDATAVENCIMENTO.AsDateTime);
    Dm.TbItContPagVLRMULTA.AsFloat :=
    DM.TbItContPagVlrAPagar.AsFloat*
    StrToFloat(FOpcoesGeral.Edit1.Text)/100;
    Dm.TbItContPagVLRJUROS.AsFloat :=
    StrToFloat(FOpcoesGeral.Edit2.Text)*ContadorDeDias;
    end
    else
    begin
    Dm.TbItContPagVLRMULTA.AsFloat := 0;
    Dm.TbItContPagVLRJUROS.AsFloat := 0;
    end;
    Dm.TbItContPag.Post; }
end;

function AtivarStatus(Codigo, tabela, Campo, Status: String): Boolean;
begin
  { With DM.QuCalc do
    begin
    Close;
    SQL.Clear;
    SQL.Add('Select '+status+' from '+Tabela);
    SQL.Add('Where '+Campo+' = '+Codigo);
    Open;
    If Fields[0].AsString<>'Sim' Then
    begin
    If MessageDLG('Este '+Tabela+' est� inativo, Deseja ativar agora?'
    , mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
    With DM.QuGrava do
    begin
    Close;
    SQL.Clear;
    SQL.Add('update '+Tabela+' set '+Status+' = '+#39+'Sim'
    +#39+' where '+Campo+' = '+Codigo);
    ExecSQL;
    Close;
    Result := True;
    end;
    end
    else
    begin
    result := False;
    Abort;
    end;
    end;
    Close;
    end; }
end;

function BuscarCodCaixa: Integer;
begin
  With DM.Query_Calcular do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select max(codcaixa) from caixa');
    Open;
    Result := Fields[0].AsInteger;
    Close;
  end;
end;

function SaldoCaixa(CodCaixa: Integer): Real;
begin
  With DM.Query_Calcular do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(valorentrada)-');
    SQL.Add('SUM(valorsaida) FROM MOVIMENTOCAIXA');
    SQL.Add('Where CodCaixa = :CodCaixa');
    ParamByName('CodCaixa').AsInteger := CodCaixa;
    Open;
    Result := Fields[0].AsFloat;
    Close;

  end;
end;

procedure InserirContPag(CodForn: Integer; TipoConta: String; TotalCompra: Real;
  CodConta, CodFunc: Integer);
begin
  { DM.TbContPag.Append;
    DM.TbContPagCODFORN.AsInteger      := CodForn;
    DM.TbContPagCODFUNC.AsInteger      := CodFunc;
    DM.TbContPagTIPOCONTA.AsString     := TipoConta;
    DM.TbContPagVLRSTCONTPAG.AsFloat   := TotalCompra;
    DM.TbContPagCODCONTA.AsInteger     := CodConta;
    DM.TbContPagSTATUSCONTPAG.AsString := 'Sim';
    DM.TbContPag.Post; }
end;

procedure InserirContRec(CodCli: Integer; TipoConta: String; TotalVenda: Real;
  CodConta: Integer);
begin
  { DM.TbContRec.Append;
    DM.TbContRecCODCLI.AsInteger       := CodCli;
    //DM.TbContRecCODFUNC.AsInteger      := CodFunc;
    DM.TbContRecTIPOCONTA.AsString     := TipoConta;
    DM.TbContRecVLCONTREC.AsFloat      := TotalVenda;
    DM.TbContRecCODVENDA.AsInteger     := CodConta;
    DM.TbContRecSTATUSCONTREC.AsString := 'Sim';
    DM.TbContRec.Post; }
end;

procedure InserirParcelaContRec(NParcela: Real; DataVencimento: TDateTime;
  ValorParcela: Real; Status: String);
begin
  { DM.TbItContRec.Append;
    DM.TbItContRecNPARCELA.AsFloat          := NParcela;
    DM.TbItContRecVALORPARCELA.AsFloat      := ValorParcela;
    DM.TbItContRecDATARECEBIDO.AsDateTime   := DataVencimento;
    DM.TbItContRecDATAVENCIMENTO.AsDateTime := DataVencimento;
    DM.TbItContRecVALORRECEBIDO.AsFloat     := ValorParcela;
    DM.TbItContRecHORARECEBIDO.AsDateTime   := Time;
    DM.TbItContRecPARCELAPAGA.AsString      := Status;
    DM.TbItContRec.Post; }
end;

procedure InserirParcelaContPag(NParcela: Real; DataVencimento: TDateTime;
  ValorParcela: Real; Status: String);
begin
  { DM.TbItContPag.Append;
    DM.TbItContPagNPARCELA.AsFloat          := NParcela;
    DM.TbItContPagDATAVENCIMENTO.AsDateTime := DataVencimento;
    DM.TbItContPagVALORPARCELA.AsFloat      := ValorParcela;
    DM.TbItContPagDATAPAGAMENTO.AsDateTime  := DataVencimento;
    DM.TbItContPagVALORPAGO.AsFloat         := ValorParcela;
    DM.TbItContPagHORAPAGAMENTO.AsDateTime  := Time;
    DM.TbItContPagPARCELAPAGA.AsString      := Status;
    DM.TbItContPag.Post; }
end;

procedure InserirPagamento(ValorPago: Real; DataPago, HoraPago: TDateTime;
  CodTipoDoc: Integer; NomeTipoDoc: String);
begin
  {
    DM.TbPagamento.Append;
    DM.TbPagamentoVALORPAGO.AsFloat         := ValorPago;
    DM.TbPagamentoDATAPAGAMENTO.AsDateTime  := DataPago;
    DM.TbPagamentoHORAPAGAMENTO.AsDateTime  := HoraPago;
    DM.TbPagamentoCODTIPODOC.AsInteger      := CodTipoDoc;
    DM.TbPagamentoSTATUS.AsString           := 'Sim';
    DM.TbPagamento.Post;

    With DM.QuCalc2 do
    begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from TipoDoc Where CodTipoDoc=:CodTipoDoc');
    ParamByName('CodTipoDoc').AsInteger := CodTipoDoc;
    Open;
    If FieldByName('caixa').AsString='Sim' then
    begin
    InserirMOVIMENTOCAIXA('Pag. ao Fornecedor: '+DM.TbCompraNomeForn.AsString,
    0,
    DM.TbPagamentoCODITCONTPAG.AsInteger,
    0,
    ValorPago,FieldByName('NomeTipoDoc').Asstring);
    end;             {
    If FieldByName('chequerec').AsString='Sim' then
    begin
    CriarForm(FCadCheque,TFCadCheque,'');
    FCadCheque.Caption := 'Cadastrar';

    If FCadCheque.Caption='Cadastrar' then
    begin
    FCadCheque.FCadFrameIBO1.EntrarForm(DM.TbCheque,DM.DsTbCheque,FCadCheque,True,True,True);
    FCadCheque.FCadFrameIBO1.BtNovo.Click;
    //              FCadCheque.HxLibDbEdit6.SetFocus;
    DM.TbChequeCODMOV.AsInteger := DM.TbPagamentoCODPAGTO.AsInteger;
    DM.TbChequeTIPOMOV.AsString := 'PAGAMENTO';
    DM.TbChequeCODCLI.AsInteger := DM.TbContRecCODCLI.AsInteger;
    DM.TbChequeVALORCHEQUEREC.AsFloat :=
    DM.TbContRecVlrTotalContRec.AsFloat;
    DM.TbChequeHISTCHEQUEREC.AsString :=
    'Cont. Rec.: '+DM.TbContRecCODCONTREC.AsString+
    ' Parcela: '+DM.TbItContRecNPARCELA.AsString;
    If FieldByName('caixa').AsString='Sim' then
    DM.TbChequeStatusChequeRec.AsString:='ATIVADO NO CAIXA';

    end; }

  // AbrirDestruirForm(FCadCheque);
  // end;
  // end;
end;

procedure InserirRecebimento(ValorRecebido: Real;
  DataRecebido, HoraRecebido: TDateTime; CodTipoDoc: Integer;
  TipoVenda: String);
var
  x: Integer;
begin

  { DM.TbRecebimento.Append;
    DM.TbRecebimentoVALORRECEBIDO.AsFloat   := ValorRecebido;
    DM.TbRecebimentoDATARECEBIDO.AsDateTime := DataRecebido;
    DM.TbRecebimentoHORARECEBIDO.AsDateTime := HoraRecebido;
    DM.TbRecebimentoCODTIPODOC.AsInteger    := CodTipoDoc;
    DM.TbRecebimentoSTATUS.AsString         := 'Sim';
    DM.TbRecebimento.Post;

    With DM.QuCalc do
    begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from TipoDoc Where CodTipoDoc=:CodTipoDoc');
    ParamByName('CodTipoDoc').AsInteger := CodTipoDoc;
    Open;

    InserirMOVIMENTOCAIXA(TipoVenda+'Recebido do Cliente: '+DM.TbVendaCODCLI.AsString,
    0,
    DM.TbRecebimentoCODITCONTREC.AsInteger,
    ValorRecebido,
    0,FieldByName('NomeTipoDoc').AsString);
    end; }

end;

function ArredondaValor(varValor: Real; varCasaDecimal: Integer): Real;
begin
  Result := StrToFloat(FloatToStrF(varValor, ffFixed, 18, varCasaDecimal));
end;

{ procedure ValidaCampos(varForm: TForm;HxQuery: TIBQuery);
  var x,y: Integer;
  begin
  //Procura campos na query que n�o est�o preenchidos
  For x := 0 To HxQuery.FieldCount -1 Do
  begin
  HxQuery.FieldByName(HxQuery.Fields[x].FieldName).AsString:=
  Trim(HxQuery.FieldByName(HxQuery.Fields[x].FieldName).AsString);
  If HxQuery.FieldByName(HxQuery.Fields[x].FieldName).Required = True then // verifica se � not null
  If Trim(HxQuery.FieldByName(HxQuery.Fields[x].FieldName).AsString) = '' then // verifica se o campo est� preenchido
  begin
  MessageDlg('O Campo '+HxQuery.Fields[x].DisplayLabel+' � obrigat�rio!',mtInformation,[mbOk],0);
  With TForm(varForm) do
  begin
  // Procura e Envia o foco ao campo no formulario
  For y := 0 To ComponentCount -1 Do
  begin
  If Components[y] Is TDbEdit Then
  begin
  If TDbEdit(Components[y]).DataField = HxQuery.Fields[x].FieldName Then
  begin
  TDbEdit(Components[y]).SetFocus;
  abort;
  end;
  end
  else
  If Components[y] Is TDbcomboBox Then
  begin
  If TDbcomboBox(Components[y]).DataField = HxQuery.Fields[x].FieldName Then
  begin
  TDbcomboBox(Components[y]).SetFocus;
  abort;
  end;
  end
  else
  If Components[y] Is TDbLookupComboBox Then
  begin
  If TDbLookupComboBox(Components[y]).DataField = HxQuery.Fields[x].FieldName Then
  begin
  TDbLookupComboBox(Components[y]).SetFocus;
  abort;
  end;
  end
  else
  If Components[y] Is TDBMemo Then
  begin
  If TDBMemo(Components[y]).DataField = HxQuery.Fields[x].FieldName Then
  begin
  TDBMemo(Components[y]).SetFocus;
  abort;
  end;
  end;
  end;
  end;
  Abort;
  end;
  end;

  end; }

function ConsultaDependencia(Campo, valorcampo, tabela, msg: String): Boolean;
begin
  With DM.Query_Calcular do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select ' + Campo + ' from ' + tabela);
    SQL.Add('where ' + Campo + ' = ' + #39 + valorcampo + #39);
    Open;
    If IsEmpty then
    begin
      Result := False;
    end
    else
    begin
      MessageDLG('N�o � poss�vel excluir este registro porque existe' + #13 +
        'uma depend�ncia com o(a) ' + msg, mtError, [mbok], 0);
      Result := True;
    end;
    Close;
  end;
end;

procedure RecalcularParcelaRec;
begin
  { Dm.TbItContRec.Edit;
    If  StrToDate(Dm.TbItContRecDATAVENCIMENTO.AsString) < Date then
    begin
    ContadorDeDias :=
    DaysBetween(Date,Dm.TbItContRecDATAVENCIMENTO.AsDateTime);
    Dm.TbItContRecVLRMULTA.AsFloat :=
    DM.TbItContRecValorReceber.AsFloat*
    DM.TbContRecTXMULTA.AsFloat/100;
    Dm.TbItContRecVLRJUROS.AsFloat :=
    DM.TbContRecTXJUROS.AsFloat*ContadorDeDias;
    end
    else
    begin
    Dm.TbItContRecVLRMULTA.AsFloat := 0;
    Dm.TbItContRecVLRJUROS.AsFloat := 0;
    end;
    Dm.TbItContRec.Post;
    end;

    procedure RollbackTranction;
    begin
    //  DM.IB_Transaction1.Rollback;
    end;

    procedure CommitTransaction;
    begin
    //  DM.IB_Transaction1.Commit;
    end;

    procedure StartTransaction;
    begin
    {  If DM.IB_Transaction1.Started Then
    DM.IB_Transaction1.Commit;
    DM.IB_Transaction1.StartTransaction; }
end;

{ procedure MostrarCamposObrigatorios(varForm: TForm;HxQuery: TIBQuery);
  var x,y: Integer;
  begin
  For x := 0 To HxQuery.FieldCount -1 Do
  begin
  //Procura os campos obrigat�rios
  If HxQuery.FieldByName(HxQuery.Fields[x].FieldName).Required = True then // verifica os campos com a propriedade required : true
  begin
  //Procura no Formul�rio
  With TForm(varForm) do
  begin
  //Procura o componente no formul�rio correspondente ao da Query
  For y := 0 To ComponentCount -1 Do
  begin
  If Components[y] Is TDbEdit Then
  If TDbEdit(Components[y]).DataField = HxQuery.Fields[x].FieldName Then
  begin
  TDbEdit(Components[y]).Color:= $00C4FEFF;
  //                        TDbEdit(Components[y]).HxOnExit := $00C4FEFF;
  end;
  If Components[y] Is TDbcomboBox Then
  If TDbcomboBox(Components[y]).DataField = HxQuery.Fields[x].FieldName Then
  begin
  TDbcomboBox(Components[y]).Color    := $00C4FEFF;
  //                   THxLibDbcomboBox(Components[y]).HxOnExit := $00C4FEFF;
  end;  {
  If Components[y] Is THxLibDbLookupComboBox Then
  If THxLibDbLookupComboBox(Components[y]).DataField = HxQuery.Fields[x].FieldName Then
  begin
  THxLibDbLookupComboBox(Components[y]).Color    := $00C4FEFF;
  THxLibDbLookupComboBox(Components[y]).HxOnExit := $00C4FEFF;
  end;
  If Components[y] Is TDbMemo Then
  If TDbMemo(Components[y]).DataField = HxQuery.Fields[x].FieldName Then
  begin
  TDbMemo(Components[y]).Color    := $00C4FEFF;
  //     THxLibDbMemo(Components[y]).HxOnExit := $00C4FEFF;
  end;
  end;
  end;
  end;
  end;
  end; }

procedure FormPadrao(nomeForm: TForm); // padronizar os formul�rios
var
  x, y: Integer;
begin

  With TForm(nomeForm) do
  begin

    BorderStyle := bsDialog; // detalhe do layout
    BorderIcons := [biSystemMenu]; // retira o icone
    AutoSize := True; // ajusta o formul�rio
    Position := poMainFormCenter; // centraliza o formulario

    For y := 0 To ComponentCount - 1 Do
    begin
      If Components[y] Is TDbEdit Then // verifica se o componente � uma dbedit
      begin
        TDbEdit(Components[y]).BevelInner := bvSpace;
        TDbEdit(Components[y]).BevelKind := bkFlat;
        TDbEdit(Components[y]).BevelOuter := bvRaised;
        TDbEdit(Components[y]).BorderStyle := bsNone;
        // TDbEdit(Components[y]).HxOnKeyPress:= True;
        if TDbEdit(Components[y]).Tag = 0 then
          TDbEdit(Components[y]).CharCase := ecUpperCase;
        // deixar os textos em maiusculos
      end;
      If Components[y] Is TDbcomboBox Then
      begin
        TDbcomboBox(Components[y]).BevelInner := bvSpace;
        TDbcomboBox(Components[y]).BevelKind := bkFlat;
        TDbcomboBox(Components[y]).BevelOuter := bvRaised;
        // TDbcomboBox(Components[y]).HxOnKeyPress:= True;
      end;
      If Components[y] Is TDbLookupComboBox Then
      begin
        // THxLibDbLookupComboBox(Components[y]).BevelInner  := bvSpace;
        // THxLibDbLookupComboBox(Components[y]).BevelKind   := bkFlat;
        // THxLibDbLookupComboBox(Components[y]).BevelOuter  := bvRaised;
        // THxLibDbLookupComboBox(Components[y]).HxOnKeyPress:= True;
      end;
      If Components[y] Is TDbMemo Then
      begin
        TDbMemo(Components[y]).BevelInner := bvSpace;
        TDbMemo(Components[y]).BevelKind := bkFlat;
        TDbMemo(Components[y]).BevelOuter := bvRaised;
        TDbMemo(Components[y]).BorderStyle := bsNone;
        // TDbMemo(Components[y]).HxOnKeyPress:= True;
      end;
      If Components[y] Is TBitBtn Then
      begin
        TBitBtn(Components[y]).Font.Color := $00710000;
        TBitBtn(Components[y]).Font.Name := 'MS Sans Serif';
        TBitBtn(Components[y]).Font.Style := [fsBold];
        TBitBtn(Components[y]).Cursor := crHandPoint;
        If TBitBtn(Components[y]).Caption <> 'Finalizar' then
        begin
          TBitBtn(Components[y]).Width := 89;
          TBitBtn(Components[y]).Height := 33;
        end
        else
        begin
          TBitBtn(Components[y]).Width := 135;
          TBitBtn(Components[y]).Height := 53;
        end;
        // THxLibBitBtn(Components[y]).Glyph      :=
        // FImagens.PegarImagem(THxLibBitBtn(Components[y]).HxBtImagem);
      end;
    end;
  end;

end;

procedure CriarForm(var varForm; varInstance: TFormClass; varParam: String);
var
  varObjeto: TObject;
begin
  If TForm(varForm) <> nil then
  begin
    MessageDLG('N�o � poss�vel visualizar a Janela. Ela j� est� aberta!',
      mtError, [mbok], 0);
    Abort;
  end;

  Application.CreateForm(varInstance, varForm);

  varObjeto := TForm(varForm).FindComponent('StatusBar1');
  If varObjeto <> nil then
    TStatusBar(varObjeto).Panels[0].Text := 'ID: ' +
      UpperCase(TForm(varForm).Name);

  If varParam <> '' then
    TForm(varForm).Caption := varParam;
end;

procedure AbrirDestruirForm(var varForm);
begin
  // TForm(varForm).Position:=poMainFormCenter;
  TForm(varForm).ShowModal;
  DestruirForm(TForm(varForm));
end;

procedure AbrirDestruirFormAcesso(var varForm; varInstance: TFormClass);
begin
  // VerificarAcesso(FPrincipal.LbCodFunc.Caption,varInstance.ClassName);

  CriarForm(varForm, varInstance, '');

  AbrirDestruirForm(varForm);
end;

procedure AbrirForm(InstanceClass: TComponentClass; nomeForm: TForm);
begin
  nomeForm.ShowModal;
end;

procedure InserirMovimentoCaixa(varHistorico: String;
  varCodRecebTo, varCodPagTo: Integer; varValorEntrada, varValorSaida: Real;
  NomeTipoDoc: String);
begin
  { If DM.TbMOVIMENTOCAIXA.Active=False Then
    DM.TbMOVIMENTOCAIXA.Open;
    DM.TbMOVIMENTOCAIXA.Append;
    DM.TbMOVIMENTOCAIXACODRECEBTO.AsInteger:= varCodRecebTo;
    DM.TbMOVIMENTOCAIXAHISTORICO.AsString  := varHistorico;
    DM.TbMOVIMENTOCAIXAVALORENTRADA.AsFloat:= varValorEntrada;
    DM.TbMOVIMENTOCAIXAVALORSAIDA.AsFloat  := varValorSaida;
    DM.TbMOVIMENTOCAIXA.Post; }
end;

function AlinharDireita(Espacos: string; Quant: Integer): String;
var
  i, Tamanho: Integer;
  aux: string;
begin
  aux := Espacos;
  Tamanho := Length(Espacos);
  Espacos := '';
  for i := 1 to Quant - Tamanho do
    Espacos := Espacos + ' ';
  aux := Espacos + aux;
  AlinharDireita := aux;
end;

end.
