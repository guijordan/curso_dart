void main() {
  print('03.0) Condicionais (if else)');
  if (!true) {
    print('Verdadeiro');
  } else {
    print('Falso');
  }

  int idade = 17; //if sem chaves
  if (idade >= 18)
    print('maior');
  else
    print('Menor');

  idade = 13;
  if (idade < 14) {
    print('Criança');
  } else if (/*idade < 18*/ idade >= 14 && idade <= 17) {
    print('Adolescente');
  } else {
    print('Adulto');
  }

  String textoInt = '10';
  String textoDouble = '10.12345';
  int numeroInt = int.parse(textoInt);
  var numeroDouble = double.parse(textoDouble).toStringAsFixed(2);

  print('ParseInt $numeroInt ParseDouble: $numeroDouble');
  print('ParseString: ${numeroDouble.toString()}');

  double peso = 115;
  double altura = 1.85;
  var tmp = peso / (altura * altura);
  print(tmp);
  double imc = double.parse(tmp.toStringAsFixed(2));
  print(imc);

  if (imc < 18.5) {
    print('IMC $imc Abaixo do peso');
  } else if (imc >= 18.5 && imc < 25) {
    print('IMC $imc peso normal');
  } else if (imc >= 25 && imc < 30) {
    print('IMC $imc Sobrepeso');
  } else if (imc >= 30 && imc <= 35) {
    print('IMC $imc grau 1');
  } else if (imc >= 35 && imc < 40) {
    print('IMC $imc Obesidade grau 2');
  } else {
    print('IMC $imc Obesidade grau 3');
  }
}
