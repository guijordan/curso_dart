///
/// * Future
///  - É um objeto que retorna um valor ou erro, resultado de uma execucao assincrona/futura.
///

//funcao retorna string
String tarefa({int tempo = 1}) {
  var msg = status(tempo);
  return 'Status: $msg';
}

Future<String> status([int tempo = 1]) {
  return Future.delayed(Duration(seconds: tempo), () => 'Primeira tarefa finalizada!\n');
}

Future<void> novaTarefa({int tempo = 1}) {
  return Future.delayed(Duration(seconds: tempo), () => print('Segunda tarefa finalizada!\n'));
}

execao({int tempo = 1}) => Future.delayed(Duration(seconds: tempo), () => throw Exception('Erro intencional'));

void contagem({int segundos = 3}) {
  print('Carregando');
  for (var i = 1; i <= segundos; i++) {
    Future.delayed(Duration(seconds: i), () {
      print('${i * 33}%');
      if (i == segundos) print('\nConcluido!');
    });
  }
}

main() {
  print('18.0.0) Futures');
  print(tarefa(tempo: 4)); // print é executado antes do termino da future

  novaTarefa(tempo: 4); // o print é executado no future

  execao(tempo: 6);
  contagem();
}
