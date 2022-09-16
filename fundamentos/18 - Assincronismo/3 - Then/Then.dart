/*
    * Conceito
    - Then registra callbacks que serão chamadas quando o future for concluído.
     * onValue: Valor passado ao termino do future.
     * catchError: Se omitido é lançado como uma exception
       * test: Se qualquer lógica retornar true é lançada a exception !
    * whenComplete: Chama uma função anônima ao termino do future
*/

///
///FUNÇÕES ASSINCRONAS.
///
Future<String?> tarefa({int tempo = 1}) {
  // var msg = status(tempo);
  // return 'Status: $msg';
  return status(tempo).then((msg) {
    return '\nStatus: $msg';
  }).catchError(
    (onError) {
      print('CatchError: $onError');
      return 'xxx';
    },
    test: (onError) => onError is! Future && onError.runtimeType != Future,
  ).whenComplete(() {
    print('Future Completa!');
  });
}

Future<String> status([int tempo = 1]) {
  //return Future.delayed(Duration(seconds: tempo), () => 'Primeira tarefa finalizada!\n');
  return Future.delayed(Duration(seconds: tempo), () => Future.error('Erro Intencional'));
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

main() {
  print('18.3.0) Then');
  contagem(segundos: 3);
  tarefa(tempo: 4).then((onValue) => print(onValue ?? 'Status: nulo'));
}
