void main() {
  print("Hello World");
  var valorA = 10;
  var valorB = 4;

  var valorC = 2.5;
  var resultado;
  resultado = valorA + valorB + valorC;
  print(resultado);

  var salario = 1000, descontos = 250;
  var conta = salario - descontos;
  print(conta);
  var numero = 3 + ((2 * 4) + (10 / 5));
  print(numero);
  print("");
  print("concatenar "
      "Strings "
      "é simples assim");

  var texto1 = '\nFernando ';
  var texto2 = "Martins";
  var texto3 = '''\n e
  Leila Martins\n''';

  var nome = texto1 + texto2 + texto3;
  print(nome);

  var verdadeiro = true;
  var falso = false;
  print('Verdadeiro = ${verdadeiro}'); // Interpolação
  print('falso = ' + "$falso"); // concatenação.
  print(''.runtimeType); // descobre o tipo de variavel em tempo de execução.

  const pi = 3.14; // variavel constante é atribuida em tempo de compilação.
  nome = 'Fernando';
  String sobrenome = 'Martins';
  int idade = 36;
  double altura = 1.83;
  bool adulto = true;

  print('\nnome: ' + "$nome \nQtd letras: ${nome.length} " + """\nSobrenome: $sobrenome \nQtd letras ${sobrenome.length}\n""");
  print(''' idade: $idade
  altura: $altura
  adulto: $adulto
  \npi: $pi\n''');

  dynamic variavel = 2.0;
  variavel = 2;
  variavel = 'dois';
  variavel = true;
  print(variavel);
}
