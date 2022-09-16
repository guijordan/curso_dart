/* 
  * Conceitos
  - Generators são funções geradoras produzem sequencias de valores usando:
   * Funções sincronas retornam Iterable
   * Funções assincronas retornam Stream
*/

/// * yield
///  * Utilizado em funções geradoras sincronas e assincronas
///  * Adiciona um valor ao fluxo de saída da função assincrona * retornando sem encerrar a função.
///
funcoesGeradoras() {
  print('18.5.1) Funções Geradoras\n');

  Iterable<int> funcaoSincrona(int repeticaoMaxima) sync* {
    int i = 0;
    while (i < repeticaoMaxima) {
      yield ++i;
    }
  }

  print(funcaoSincrona(5));

  Stream<int> funcaoAsincrona(int repeticaoMaxima) async* {
    int i = 0;
    while (i < repeticaoMaxima) {
      yield ++i;
    }
  }

  funcaoAsincrona(3).forEach((e) => print(e));
}

/// * yield *
///  * Utilizado em funções geradoras sincronas e assincronas recursivas
///  * Você poderá melhorar seu desempenho usando yield* usando gerador for recursivo
///
funcoesGeradorasRecursivas() {
  print('18.5.2) Funções Geradoras Recursivas \n');
  Iterable<int> funcaoSincrona(int repeticaoMaxima) sync* {
    for (int i = 1; i <= repeticaoMaxima; i++) {
      yield i;
      yield* funcaoSincrona(i - repeticaoMaxima);
    }
  }

  Stream<int> funcaoAsincrona(int repeticaoMaxima) async* {
    for (int i = 1; i <= repeticaoMaxima; i++) {
      yield i;
      yield* funcaoAsincrona(i - repeticaoMaxima);
    }
  }

  funcaoAsincrona(3).forEach((e) => print(e));
}

///
/// * Try Catch
///  * Tratamento excecoes !
tratamentosExcecoes() async {
  print('18.5.3) Funções Geradoras Tratamento de exceções \n');

  Future<int> streamSoma(Stream<int> stream) async {
    var soma = 0;
    // await for (var valor in stream) {
    //   soma += valor;
    // }
    // return soma;
    try {
      await for (var valor in stream) {
        soma += valor;
      }
    } catch (e) {
      print(e);
      return -1;
    }
    return soma;
  }

  Stream<int> streamContagem(int termino, {int erro = 0}) async* {
    for (int i = 1; i <= termino; i++) {
      //yield i;
      if (i == erro) {
        throw Exception('Exception Intencional');
      } else {
        yield i;
      }
    }
  }

  var stream = streamContagem(10, erro: 3);
  var soma = await streamSoma(stream);
  print(soma);
  // stream.forEach((e) => print(e));
  // print('teste');
}

main() {
  // funcoesGeradoras();
  //funcoesGeradorasRecursivas();
  tratamentosExcecoes();
}
