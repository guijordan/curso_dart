/*
  * Const
  - Inicializada em tempo de compiçação, deve ser declarada com valor constante
  - Ao nível de casses deve ser statica para ficar disponível na classe
  - Em coleções const toda o conteúdo deve ser constante
  * Objeto Imutável
   - O construtor deve ser constante
   - As variaveis devem ser final ou static const
*/

import 'Brasil.dart';

void main() {
  print('10.2) Modificadores Const\n');
  const pi = 3.14;
  double raio = 2;
  var resultado = pi * (raio * raio);
  print('${resultado}\n');

  final numeros = [raio, 2.5];
  numeros.add(resultado);
  print(numeros);

  final listaFinal = const [0, 1];
  //listaFinal.add(2);
  print(listaFinal);

  const listaConst = [1, 2, pi];
  //listaConst.add(pi);
  print('${listaConst}\n');

  for (var i = 0; i < 3; i++) {
    final indiceFinal = i;
    const constante = 1;
    print('contagem ${constante + indiceFinal}');
  }

  var pais = new Brasil(-15.792371, -47.882326);
  print('\nObjeto: $pais capital: ${Brasil.capital} latitude: ${pais.latitude} longitude: ${pais.longitude}');
  print('Estados: ${Brasil.estados}');
  // pais.latitude = 0;
  // Brasil.capital = "Belford Roxo";
}
