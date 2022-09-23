import 'dart:math';

main() {
  print('3) Random\n');

  var random = new Random();
  var min = 1, max = 2;
  for (var i = 0; i < 3; i++) {
    //print(random.nextInt(max + 1));
    print(min + random.nextInt(max));
    //print(random.nextDouble().toStringAsFixed(2));
    //print(random.nextBool());
  }
  print(Utilidades.criarString(10));
}

class Utilidades {
  static const _alfabeto = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  static String criarString(int numeroLetras) {
    var random = Random(DateTime.now().microsecondsSinceEpoch);
    String resultado = '';
    for (var i = 0; i < numeroLetras; i++) {
      resultado += _alfabeto[random.nextInt(_alfabeto.length)];
    }
    return resultado;
  }
}
