///
///Funções Anônimas não possui nomes.
///
funcoesAnonimas() {
  print('06.4.0) Funções Anônimas Conceito\n');
  print('''SINTAXE
  
  (){
    print('Função Anônima!');
  }

  () => print('Função Anônima usando sintaxe arrow');

  ''');
  print('06.4.1) Funções Anônimas Como variáveis\n');

  var variavelAnonima = () => print('Variavel anônima');
  variavelAnonima();

  var variavelAnonimaComoParametro = (String msg) => print('Variavel anônima $msg');

  variavelAnonimaComoParametro('Com Parâmetro');

  print('06.4.0) Funções Anônimas Como Parâmetros\n');

  void executarFuncao(Function funcao) => funcao();
  executarFuncao(() => print('Função Anônima passada como parâmetro'));
  executarFuncao(() {
    print('Função Anônima passada como parâmetro');
    print('xxxx');
  });
}

void main() {
  funcoesAnonimas();
}
