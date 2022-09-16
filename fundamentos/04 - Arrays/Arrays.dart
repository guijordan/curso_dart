///
///Array é uma lista dinâmica e ordenada de elementos entre chaves.
///
void main() {
  print('04.0) Arrays\n');
  var textos = ['Fernando', 'Leila'];
  var numeros = [1, 2.5, 5, 31, 36];
  var condicoes = [!false, true, false, null];
  print('${textos[0]} e ${textos[1]}');
  print('${textos[0]} tem ${numeros[4]} anos');
  print('${textos[1]} ${numeros[3] > 17 ? 'é maior' : 'não é maior'} de idade');
  print('condicoes[3] == null: ${condicoes[3] ?? (condicoes[0] != null && condicoes[0] == true ? condicoes[1] : condicoes[2])}');

  bool verdadeiro = !false;
  List<Object?> arrayDinamico = ['texto', [], 3, 1.5, verdadeiro];
  print(arrayDinamico);
  arrayDinamico[0] = textos[0];
  arrayDinamico[1] = ['Martins', 'de', 'Andrade'];
  arrayDinamico[2] = numeros[2];
  arrayDinamico[3] = numeros[1];
  arrayDinamico[4] = !verdadeiro;
  print(arrayDinamico);

  print('\n04.1) Arrays funções \n');
  arrayDinamico.add(condicoes[3]);
  arrayDinamico.insert(0, 'Leila');
  arrayDinamico.removeAt(1);
  arrayDinamico.removeRange(1, 4);
  arrayDinamico.remove('Leila');
  print(arrayDinamico);
  print(arrayDinamico.length);

  arrayDinamico.clear();
  print('$arrayDinamico == null ${arrayDinamico == null}');
  print('$arrayDinamico == empty ${arrayDinamico.isEmpty}');
  arrayDinamico.length = 1;
  print('O array está nulo: ${arrayDinamico == null}');
  print('$arrayDinamico ?? ${arrayDinamico.contains(null)}');

  numeros = [10, 5, 1, 2.25, 7.5];
  numeros.sort();
  print(numeros);
  textos = ['Fernando', 'Leila', 'Bartolomeu'];
  textos.sort((b, a) => a.compareTo(b)); // basta inverter ordem a, b para obter uma lista crescente
  print(textos);
}
