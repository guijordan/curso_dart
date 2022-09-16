/*
  * Sincrona: 
  - Operações sincronas: Bloqueia a execução até que seja concluída!
  - Funções sincronas: Executa somente operações sincronas

  * Assincronas:
  - Funções assincrona: Executam ao menos uma operação assincrona e operações sincronas.
  - Operações assincronas: Permite executar outras operações enquanto são processadas.
  * Await

  - Indica a espera de uma operação assincrona, conclusão de uma future!

  * Async
  - É deve ser usado em toda função que tenha operações assincronas, Await!

*/

///
/// * Funções Assincronas !
///
Future<String> tarefa({int tempo = 1}) async {
  var msg = await status(tempo);
  return 'Status: $msg';
}

Future<String>? status([int tempo = 1]) {
  try {
    //Future.error('Tempo insuficiente para o Load Programado!');
    if (tempo < 4) throw Exception('Tempo insuficiente para o Load Programado!');
    return Future.delayed(Duration(seconds: tempo), () => 'Primeira tarefa finalizada!\n');
  } catch (e) {
    print('catch $e');
    return null;
  }
}

///
/// * Função Sincrona !
///
void contagem({int segundos = 3}) {
  print('Carregando');
  for (var i = 1; i <= segundos; i++) {
    Future.delayed(Duration(seconds: i), () {
      print('${i * 33}%');
      if (i == segundos) print('\nConcluido!');
    });
  }
}

main() async {
  print('18.2.0) Async Await\n');
  contagem(segundos: 3); // função sincrona

  print(await tarefa(tempo: 3)); //função assincrona !
}
