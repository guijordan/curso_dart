///
///Funções com parâmetros posicionados devem obedecer a ordem declarada!
///Funções com parametros nomeados deve ser declarado !
///Os parametros posicionados ou nomeados devem começar pelo ultimo parametro da função!
///
funcaoParametros() {
  print('06.3.1) Funções com parametros posicionados e default\n');

  void exibirDados1(String nome, [int peso = 65, double altura = 1.80]) {
    print('Nome: $nome Peso: $peso Altura: $altura');
  }

  exibirDados1('Fernando');
  exibirDados1('Fernando', 70);
  exibirDados1('Fernando', 70, 1.83);

  print('\n06.3.1) Funções com parametros posicionados e default\n');

  exibirDados2(String nome, {int peso = 0, double? altura}) {
    print('Nome: $nome Peso: $peso Altura: ${altura ?? 'Não informado'}');
  }

  exibirDados2('Fernando');
  exibirDados2('Fernando', peso: 70, altura: 1.83);
  exibirDados2('Fernando', peso: 65);

  print('\n06.3.3) Funções com parametros para outras funções\n');

  void saudacao(String nome, {Function? funcaoFalar}) {
    print('Olá, eu sou $nome!');
    if (funcaoFalar != null) {
      funcaoFalar();
    }
  }

  void falar() {
    print('Éssa é uma função passado como parametro nomeado!');
  }

  saudacao('Fernando', funcaoFalar: falar);
  saudacao('Fernando', funcaoFalar: () => print('Essa é uma função Anônima'));
}

void main() {
  funcaoParametros();
}
