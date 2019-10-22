program PControle;

uses
  Vcl.Forms,
  U_Cidade in 'U_Cidade.pas' {F_Cidade},
  U_FrameButton in 'U_FrameButton.pas' {Frame_Button: TFrame},
  U_DM in 'U_DM.pas' {DM: TDataModule},
  U_Cliente in 'U_Cliente.pas' {F_Cliente},
  U_Menu in 'U_Menu.pas' {F_Menu},
  Vcl.Themes,
  Vcl.Styles,
  U_Fornecedor in 'U_Fornecedor.pas' {F_Fornecedor},
  U_Funcionario in 'U_Funcionario.pas' {F_Funcionario},
  U_Produto in 'U_Produto.pas' {F_Produto},
  U_PesquisaCidade in 'U_PesquisaCidade.pas' {F_PesquisaCidade},
  U_PesquisaCliente in 'U_PesquisaCliente.pas' {F_PesquisaCliente},
  U_PesquisaFornecedor in 'U_PesquisaFornecedor.pas' {F_PesquisarFornecedor},
  U_PesquisaFuncionario in 'U_PesquisaFuncionario.pas' {F_PesquisaFuncionario},
  U_PesquisaProduto in 'U_PesquisaProduto.pas' {F_PesquisaProduto},
  U_Venda in 'U_Venda.pas' {F_Venda},
  U_ItemVenda in 'U_ItemVenda.pas' {F_ItemVenda},
  U_FinalizacaoVenda in 'U_FinalizacaoVenda.pas' {F_FinalizacaoVenda},
  U_Compra in 'U_Compra.pas' {F_Compra},
  U_ItemCompra in 'U_ItemCompra.pas' {F_ItemCompra},
  U_FinalizacaoCompra in 'U_FinalizacaoCompra.pas' {F_FinalizacaoCompra},
  U_Funcao in 'U_Funcao.pas',
  U_ContasReceber in 'U_ContasReceber.pas' {F_ContasReceber},
  U_ParcelaContasReceber in 'U_ParcelaContasReceber.pas' {F_ParcelaContasReceber},
  U_ReceberParcela in 'U_ReceberParcela.pas' {F_ReceberParcela};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Onyx Blue');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TF_Menu, F_Menu);
  Application.CreateForm(TF_PesquisaCliente, F_PesquisaCliente);
  Application.CreateForm(TF_Cidade, F_Cidade);
  Application.CreateForm(TF_Cliente, F_Cliente);
  Application.CreateForm(TF_PesquisaCidade, F_PesquisaCidade);
  Application.CreateForm(TF_Fornecedor, F_Fornecedor);
  Application.CreateForm(TF_Funcionario, F_Funcionario);
  Application.CreateForm(TF_Produto, F_Produto);
  Application.CreateForm(TF_PesquisarFornecedor, F_PesquisarFornecedor);
  Application.CreateForm(TF_PesquisaFuncionario, F_PesquisaFuncionario);
  Application.CreateForm(TF_PesquisaProduto, F_PesquisaProduto);
  Application.CreateForm(TF_Venda, F_Venda);
  Application.CreateForm(TF_ItemVenda, F_ItemVenda);
  Application.CreateForm(TF_FinalizacaoVenda, F_FinalizacaoVenda);
  Application.CreateForm(TF_Compra, F_Compra);
  Application.CreateForm(TF_ItemCompra, F_ItemCompra);
  Application.CreateForm(TF_FinalizacaoCompra, F_FinalizacaoCompra);
  Application.CreateForm(TF_ContasReceber, F_ContasReceber);
  Application.CreateForm(TF_ReceberParcela, F_ReceberParcela);
  Application.Run;
end.
