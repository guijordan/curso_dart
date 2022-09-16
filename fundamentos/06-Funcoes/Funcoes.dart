void semRetorno() {
  print('06.0) Funcoes sem retorno\n');

  void conceito() {
    print('Função void sem retorno');
  }

  void somarValores(int valorA, int valorB) {
    var resultado = valorA + valorB;
    print('Soma: $valorA + $valorB = $resultado');
  }

  void verificarMaioridade(String nome, int idade) {
    var resposta;
    if (idade >= 18) {
      resposta = 'é maior';
    } else {
      resposta = 'não é maior';
    }
    print('$nome $resposta de idade!');
  }

  void contagemRegressiva(int numero) {
    for (var i = numero; i >= 0; i--) {
      print('contagem ${(i == 0) ? 'VAI!!!!' : i}');
    }
  }

  converterKparaMinhas(dynamic array) {
    dynamic milha = 0.621271;
    for (dynamic item in array) {
      print('$item\t km/h em Milhas/h ${(item * milha).toStringAsFixed(2)}\n');
    }
    print('Array convertido e arrendondado');
  }

  conceito();
  somarValores(2, 3);
  verificarMaioridade('Fernando', 36);
  contagemRegressiva(3);
  converterKparaMinhas([1, 5, 10, 30, 40, 60, 80, 100, 120, 140, 160, 180, 200]);
}

comRetorno() {
  print('06.1) Funções com retorno\n');

  String conceito() {
    return 'Função com retorno String';
  }

  String somarValores(int valorA, int valorB) {
    var resultado = valorA + valorB;
    return 'Soma: $valorA + $valorB = $resultado\n';
  }

  String verificarMaioridade(String nome, int idade) {
    var resposta;
    if (idade >= 18) {
      resposta = 'é maior';
    } else {
      resposta = 'não é maior';
    }
    return '$nome $resposta de idade!\n';
  }

  String contagemRegressiva(int numero) {
    var resultado;
    for (var i = numero; i >= 0; i--) {
      (i != 0) ? print('Contagem: $i') : resultado = 'Contagem VAI!!!';
    }
    return resultado;
  }

  converterKparaMinhas(dynamic array) {
    dynamic milha = 0.621271;
    for (dynamic item in array) {
      print('$item\t km/h em Milhas/h ${(item * milha).toStringAsFixed(2)}\n');
    }
    return 'Array convertido e arrendondado';
  }

  print(conceito());
  print(somarValores(2, 3));
  print(verificarMaioridade('Fernando', 36));
  print(contagemRegressiva(3));
  print(converterKparaMinhas([1, 5, 10, 30, 40, 60, 80, 100, 120, 140, 160, 180, 200]));
}

void main() {
  semRetorno();
  comRetorno();
}
