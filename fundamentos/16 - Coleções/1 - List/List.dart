import 'dart:math';

///
///* Conceito
/// - List é uma coleção dinamica e ordenada de elementos entre colchetes []
/// - forEach: Aplica a função anônima a cada elemento da nossa coleção
/// - Todo array é um List<?>
///
listForEach() {
  print('16.1.0) List ForEach\n');
  var array = [0, 2.5, 5, 7.25, 10];
  array.forEach((elemento) {
    print('foreach: $elemento');
  });

  List<int> inteiros = [1, 5, 10];
  List<double> doubles = [2.5, 7.25];
  List<bool> booleanas = [true, false, !true, !false];
  List<String> frutas = ['Morango', 'Banana', 'Tomates'];

  print('\nImplementação: ${frutas.runtimeType}');

  print('\nbooleanas[3]: ${(booleanas[inteiros.length]) ? 'Verdadeiro' : 'False'}\n');

  frutas.insert(0, 'Abacaxi');
  frutas.add('Laranja');
  frutas.forEach((e) => print('Foreach $e'));
  print(frutas);
  frutas.removeLast();
  frutas.removeWhere((e) => e == 'Banana');
  print(frutas);
  print(frutas.elementAt(2));
  print(frutas.contains('abacaxi')); //camelcase

  List<num> numeros = List.from(inteiros)
    ..addAll(doubles)
    ..shuffle()
    ..sort();
  print('\n$numeros');

  List<dynamic> lista = List.filled(2, null);
  lista = numeros.take(3).skip(1).take(2).toList();
  print('lista $lista');

  //geradores de lista
  List<String> listaPreenchida = List.filled(2, 'elemento');
  List<String> listaGerada = List.generate(2, (i) => 'Nome ${i}');
  List<double> listaPrecos = List.generate(5, (i) => double.parse(((i + 1) * Random().nextDouble()).toStringAsFixed(2)));
  print('listaPreenchida $listaPreenchida \nLista Gerada: $listaGerada \nListaPrecos: $listaPrecos');
  listaPrecos.forEach((e) => print('forEach: $e'));
}

///
///* Expand:
/// - Cria uma nova lista expandindo ou concatenando os elementos
///
listExpand() {
  print('\n16.1.1) List Expand\n');

  var lista = [
    [1, 2],
    [3, 4]
  ];

  List<dynamic> listaFlat = lista.expand((elemento) => elemento).toList();
  List<dynamic> listaDuplacada = listaFlat.expand((e) => [e, e]).toList();
  print('listaFlat: $listaFlat \nlistaDuplicada: $listaDuplacada');

  List<num> numeros = [1, 2.5, 5, 7.25, 10];
  List<int> inteiros = [1, 5, 10];
  List<double> doubles = [2.5, 7.25];
  List<dynamic> listaDinamica = List.filled(1, null);
  print('$listaDinamica');
  print(listaDinamica = [1, 5, 10] + [2, 7]);
  print(listaDinamica = []
    ..addAll(inteiros)
    ..addAll(doubles));

  print(listaDinamica = [0, ...inteiros, 15]); // Operador spread (espalhar);
  print(listaDinamica = [...[], ...inteiros, if (doubles is List<double>) ...doubles]);
  print(listaDinamica = [...[], for (var numero in numeros) numero]);
}

///
///* Map:
/// - Transforma/Seleciona os elementos de uma coleção criando uma nova coleção do mesmo tamanho.
listMap() {
  print('\n16.1.2) List Map\n');

  List<String> frutas = ['Morango', 'Banana', 'Tomate'];
  List<String> frutasMapeadas = frutas.map((e) => '$e é uma fruta!').toList();
  print(frutasMapeadas);

  List<int> inteiros = [1, 5, 10];
  var incrementar = (int e) => ++e; //e++
  final dobro = (int e) => e * 2;
  List<int> inteirosMapeados = inteiros.map(incrementar).map(dobro).toList(); //List<int> com operações os elementos devem ser setados como int.
  print(inteirosMapeados);

  List<double> doubles = [2.75, 5.5, 7.25];
  final triplo = (e) => e * 3;
  final Function(dynamic) moeda = (e) => 'RS ${e.toDouble().toStringAsFixed(2).replaceFirst('.', '.')}';
  Function(dynamic) porcentagem(desconto) => (valor) => desconto * valor; //closure
  List<dynamic> doublesMapeados = doubles.map(triplo).map(porcentagem(0.9)).map(moeda).toList();
  print(doublesMapeados);
}

///
/// * Every:
///  - Faz o teste em todos os elementos com o operador lógico '&&' retornando true ou false
///
listEvery() {
  print('\n16.1.3) List Every \n');

  List<int> inteiros = [0, 1, 2, 3, 4, 5];
  bool resultado = inteiros.every((e) => e > 0);
  print(resultado);

  List<String> textos = List.from(['Fernando', 'Leila', 'Chloe']);
  resultado = textos.every((e) {
    return e.contains('e');
  });
  print(resultado);
}

///
/// * Where
///  - Filtra os elementos da coleção criando uma nova do mesmo tamanho ou menor.
///
listWhere() {
  print('\n16.1.4) List Where\n');

  List<int> idades = [36, 12, 18, 31, 17, 23];
  print(idades.where((e) => e is int)); // Retorno em iterable

  print(idades.whereType<int>());

  List<int> adultos = idades.where((int e) => e > 17).toList();
  print('adultos: $adultos');

  var crianca = idades.singleWhere((int e) => e < 12, orElse: () => 0);
  print('adultos: $adultos criança $crianca');

  int menor = idades.lastWhere((e) => e.toString().startsWith('1'), orElse: () => 0);

  print('adultos: $adultos menor: $menor criança: $crianca');
}

///
///* Reduce
/// - Compara os elementos da coleção retornando 1 único elemento resultante!
/// - Ao interagir com os elementos o indice 0 se torna o anterior e o indice 1 se torna o atual.
///
listReduce() {
  print('\n16.1.5) List Reduce\n');

  List<int> numerosPares = List.generate(6, (i) => i * 2);
  print(numerosPares);
  int resultado = numerosPares.reduce((anterior, atual) {
    print('$anterior + $atual');
    return anterior + atual; // O retorno será o próximo anterior.
  });
  print(resultado);

  List<bool> boleanas = [true, false, !true, !false];
  bool and = boleanas.reduce((anterior, atual) => anterior && atual);
  bool or = boleanas.reduce((anterior, atual) => anterior || atual);
  print('and: $and or: $or');

  List<int> idades = [36, 12, 18, 31, 17, 23];
  int maisNovo = idades.reduce((anterior, atual) => (anterior > atual) ? atual : anterior);
  int maisVelho = idades.reduce((anterior, atual) => (anterior < atual) ? atual : anterior);
  int media = idades.reduce((anterior, atual) => anterior + atual);
  print('mais novo: $maisNovo mais velho: $maisVelho media ${(media / idades.length).toStringAsFixed(1)}');
}

///
/// - Compara os elementos da coleção retornando um único elemento resultante!
///  - O valor inicial se torna o anterior e o indice 0 se torna o atual.
///
listFold() {
  print('\n16.1.6) List Fold \n');

  List<int> numerosPares = List.generate(6, (i) => i * 2);
  print(numerosPares);
  int valorInicial = 10;
  int resultado = numerosPares.fold(valorInicial, (anterior, atual) {
    print('$anterior + $atual');
    return anterior + atual;
  });
  print(resultado);

  valorInicial = 30;
  resultado = numerosPares.fold(valorInicial, (anterior, atual) {
    print('$anterior - $atual');
    return anterior - atual;
  });
  print(resultado);
}

void main() {
  listForEach();
  listExpand();
  listMap();
  listEvery();
  listWhere();
  listReduce();
  listFold();
}
