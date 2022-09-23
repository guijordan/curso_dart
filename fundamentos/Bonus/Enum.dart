/*
  * Conceito
    Um enumeration é usada para definir valores constantes nomeados.
*/

enum Status { indefinido, rodando, parado, pausado }

enum Time { hour, day, week, month, year }

String timtToString(Time time) {
  switch (time) {
    case Time.hour:
      return '1h';
    case Time.day:
      return '1d';
    case Time.week:
      return '1w';
    case Time.month:
      return '1m';
    case Time.year:
      return '1y';
    default:
      return '1h';
  }
}

main() {
  print('5) Enum\n');
  print('length: ${Status.values.length} values: ${Status.values}\n');
  print('Acessando o index: ${Status.values[1]}\n');
  print('Rodando: ${Status.rodando}, Indice: ${Status.rodando.index}\n');

  for (var i = 0; i < Status.values.length; i++) {
    print('Indice: $i valor ${Status.values[i]}');
  }

  print('');

  for (var value in Status.values) {
    print('Indice: ${value.index} value: ${value}');
  }

  print('');

  Status.values.forEach((e) => print('indice: ${e.index} value: $e'));
}
