/*
  * Conceito: 
   - Stream é uma forma de montiorar eventos. Ao adicionar eventos na tream os ouvintes serão notificados!
    * As stream fornecem uma sequencia assíncrona de dados. Para processar uma stream use await() ou listen()
    * Existem dois tipos de stream: assinatura única(subscription) ou transmissao(broadcast). 
    * Stream é uma sequencia com vários Futures! Ao invés de obter um evento solicitado(Future) a strema informa que há um evento quando está pronto.abstract


    * Stream
    - Fluxo que a classe StreamController() está gerenciando

    *add()
    Adiciona eventos na stream notificando os ouvintes que estão monitorado!


    *listen()
    - Inscreve um ouvinte na stream para aguardar notificações de eventos.
     * onData: Notifica o assinante com eventos de dados da stream, se for nulo nada acontece.
     * onError: Tratamento de eventos com erro e possível rastreamento Stack trace. Se omitido erros serão considerados excpetions !
     * onDone: Evento quando a stream é fechado
     * cancelOnError: A assinatura é cancelada automaticamente ao receber um evento erro !
*/

import 'dart:async';

///
/// * Conceito
///
conceito() {
  print('18.4.1) Strem Conceito\n');

  var lista = List<dynamic>.empty(growable: true);

  //1)controlador
  var controlador = StreamController<dynamic>();

  //2)stream
  var stream = controlador.stream;

  //3) Inscrição de ouvintes na stream

  stream.listen((onData) {
    print('evento: $onData');
    lista.add(onData);
  }, onDone: () {
    print('Stream Finalizada');
    print(lista);
  });

  //4)adicionar um evento a stream
  controlador.sink.add('Fernando');
  controlador.sink.add(36);
  controlador.sink.add(1.83);
  controlador.sink.add(false);
  controlador.close();

  print('Monitorando..');
}

///
/// * MODEL
///
class Contador {
  var _contagem = 1, termino, erro;
  final _controlador = StreamController<int>();

  Sink<int> get sink => _controlador.sink; //nãoexpor o controlador exponha as interfaces
  Stream<int> get stream => _controlador.stream;

  Contador({this.termino = 5, this.erro = 3}) {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _contagem < termino ? sink.add(_contagem) : sink.close();
      _contagem++;
      if (_contagem == erro) _controlador.addError('Erro intencional');
      if (_contagem > termino) timer.cancel();
    });
  }
}

model() {
  print('18.4.2) Stream Model\n');

//Stream
  var minhaStream = Contador(termino: 5, erro: 3).stream.asBroadcastStream();

  //inscricao de ouvintes da stream
  final inscrito1 = minhaStream.listen(
    (onData) {
      print('Inscrito 1: $onData');
    },
    onError: (erro) {
      print('Inscrito 1: $erro');
    },
    cancelOnError: false,
    onDone: () {
      print('Inscrito 1 Completo !');
    },
  );

  var pares = (e) => e % 2 == 0;
  var mapear = (e) => '$e é par';

  //modificar eventos
  final inscrito2 = minhaStream.where(pares).map(mapear).listen(
        (onData) {
          print('Inscrito 2: $onData');
        },
        onError: (erro) {
          print('Inscrito 2: $erro');
        },
        cancelOnError: false,
        onDone: () {
          print('Inscrito 2 Completo !');
        },
      );

  //gerenciar inscritos
  for (var i = 1; i <= 3; i++) {
    Future.delayed(Duration(seconds: i), () {
      if (i == 1) inscrito1.pause();
      if (i == 2) inscrito1.resume();
      if (i == 3) inscrito1.cancel();
    });
  }
}

///
/// * Métodos
///
metodos() async {
  print('18.4.3) Stream Métodos e ouvintes\n');
  var stream = Stream<dynamic>.periodic(Duration(seconds: 1), (e) => e + 1).take(5).asBroadcastStream();
  stream = stream.takeWhile((e) => e <= 5).skipWhile((e) => e > 3).take(3).map((event) => event.toString().padLeft(2, '0'));

  //ouvintes
  stream.listen((onData) {
    print('listen: $onData');
  }, onDone: () {
    print('Contagem Finalizada');
  });

  // stream.forEach((e) => (print('ForEach $e')));

  // await for (dynamic evento in stream) {
  //   print('forIn: $evento');
  // }

//   List<dynamic> eventos = await stream.toList();
//   print(eventos);

  Future<List<dynamic>> eventosFuturos = stream.toList();
  print(await eventosFuturos);
}

main() {
  //conceito();
  //model();
  metodos();
}
