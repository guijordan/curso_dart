/*
num(int, double), String, bool , dynamic
*/
void main() {
  print('01.1) Variaveis Funcoes');
  num pi = 3.14;
  print(pi.floor());
  print(pi.round());
  print(pi.ceil());
  print(pi.clamp(3, 3.1));
  print(pi.compareTo(3));
  print(pi.remainder(3));
  print(pi.toInt());
  print(2.toDouble());
  print(pi.toString());
  print(pi.toStringAsFixed(1));
  print(pi.truncate());
  print(pi.isNegative);
  print(pi.isInfinite);
  print((pi / 0).isInfinite);
  print(12.gcd(16));
  print('1'.padLeft(2, '0'));

  print('');
  String nome = 'Fernando';
  String nomeCompleto = '\t Fernando Martins';
  print(nome.toLowerCase());
  print(nome.toUpperCase());
  print(nomeCompleto.trim());
  print(nomeCompleto.split(" "));
  print(nome.split(''));
  print(nome.substring(3, 8));
  print(nome.startsWith('F'));
  print(nome.startsWith('nando', 3));
  print(nome.replaceAll('a', 'o'));
  print(nome.replaceFirst('Fer', ''));
  print(nome.replaceFirst('o', 'a', 7));
  print(nome.replaceRange(3, 5, ''));
  print(nomeCompleto.trim().split(''));
  print(nome.contains('f'));
  print(nome.contains('e', 1));
  print(nome.indexOf('nando'));
  print(nome.length);
  print(nome.endsWith('o'));
  print(nome.compareTo('Fernando'));
  print(nome.compareTo('Fer'));
  print(nome.compareTo('Lidiane'));
  print(' '.isEmpty);
  print(double.parse('12.55'));
  print('1' is String);
  print(int.parse('12') is int);
  print(nome.lastIndexOf('a'));
  String sopa = 'sopa de letrinhas';
  int index = sopa.indexOf(' de ');
  print('A sopa é ${sopa.substring(index).trim()}');

  print(' ');
  num numero = 3.14;
  print(numero is double);
  print(numero is! double);
}
