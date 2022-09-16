void main() {
  print('02.0) Operadores lógicos (&& || !)');
  var verdadeiro = !false;
  bool falso = !true;
  print('Verdadeiro  = $verdadeiro Falso = $falso');
  print('Operador (!) !true = ${!true} !false ${!false}');
  bool teste1 = verdadeiro || verdadeiro;
  bool teste2 = verdadeiro || falso;
  bool teste3 = falso || falso;
  print(teste1);
  print(teste2);
  print(teste3);
  teste1 = verdadeiro && verdadeiro;
  teste2 = verdadeiro && falso;
  teste3 = falso && falso;
  print(teste1);
  print(teste2);
  print(teste3);
  bool operacao = (1 <= 2) && (3 > 2);
  print(operacao);

  operacao = !(1 > 2) && ((3 < 2) || falso);
  print(operacao);
}
