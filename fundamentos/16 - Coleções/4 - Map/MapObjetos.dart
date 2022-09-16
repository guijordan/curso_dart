import 'Models/Carro.dart';
import 'Models/Pessoa.dart';

main() {
  print('16.4.5) Map Objetos\n');
  Carro c1 = Carro('Honda', 'Cívic');
  Carro c2 = Carro('Toyota', 'Corola');
  Carro c3 = Carro('Fiat', 'Palio');

  Map<String, Carro> carros = {'0': c1, '1': c2};
  carros['2'] = c3;

  for (var i = 0; i < carros.length; i++) {
    print('for: $i ${carros["${i}"]!.modelo}'); //Se ordenado por string ou num pode usar for
  }

  for (String chave in carros.keys) {
    final carro = carros[chave];
    print('forIn: $chave ${carro?.modelo}');
  }

  carros.forEach((chave, valor) => print('forEach: $chave ${valor.modelo}'));

  print('\n16.4.5) Map Singletons');
  Pessoa p1 = Pessoa('Fernando', idade: 36, peso: 65);
  Pessoa p2 = Pessoa('Leila', idade: 31, peso: 60);
  Pessoa('Fernando', idade: 63);
  Pessoa('Leila', idade: 13);
  Pessoa('Chloe');
  Pessoa.mostrarPessoas();
  p1.peso = 70;
  Pessoa.mostrarDetalhes('Fernando');
  p2.peso = 61.1;
  Pessoa.alterarDetalhes('Chloe', idade: 1, peso: 7);
  Pessoa.mostrarPessoas();
}
