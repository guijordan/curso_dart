import 'Models/Caracteristicas.dart';
import 'Models/Carro.dart';
import 'Models/Multa.dart';
import 'Models/Pessoa.dart';
import 'Models/Proprietario.dart';
import 'Models/Venda.dart';
import 'Models/Vendedor.dart';

main() {
  print('16.1.7) List manipulando objetos\n');

  Pessoa p1 = Pessoa('Fernando', 'Martins', identidade: 12345678);
  Pessoa p2 = Pessoa('Leila', 'Martins', identidade: 87654321);
  List<Pessoa> pessoas = [p1, p2];
  pessoas.add(Pessoa('Chloe', 'Martins'));

  for (var i = 0; i < pessoas.length; i++) {
    print('for: ${pessoas[i].nome} ${pessoas[i].sobrenome} id: ${pessoas[i].identidade}');
  }

  print('');

  for (var pessoa in pessoas) {
    print('for in: ${pessoa.nome} ${pessoa.sobrenome} id: ${pessoa.identidade}');
  }

  print('');

  pessoas.forEach((e) {
    print('forEach: ${e.nome} ${e.sobrenome} id: ${e.identidade}');
  });

  print('\n16.1.8) List ordenando objetos\n');

  List<Vendedor> vendedores = List.empty(growable: true);
  vendedores.add(Vendedor('Fernando', [Venda('iPhoneX', 4199.99), Venda('MacBookPro', 5300.00), Venda('GalaxyS10', 3500.25)]));
  vendedores.add(Vendedor('Leila', [Venda('iPhone8', 3000.00), Venda('GalaxyS10', 3500.25), Venda('iPhoneX', 4199.99)]));
  vendedores.add(Vendedor('Chloe', [Venda('iPhoneX', 4199.99), Venda('iPhoneX', 4199.99), Venda('GalaxyS10', 3500.25)]));

  //organizar a lista de vendas pela soma total
  vendedores.sort((b, a) => a.vendas.fold(0, (num anterior, atual) => anterior + atual.preco).compareTo(b.vendas.fold(0, (num anterior, atual) => anterior + atual.preco)));
  //organizar as vendas de cada venedor
  vendedores.forEach((e) => e.vendas.sort((b, a) => a.preco.compareTo(b.preco)));
  vendedores.forEach((e) {
    print('Vendedor: #${e.nome} \t ${e.vendas.length} vendas \t totalizando ${e.vendas.fold(0, (num anterior, atual) => anterior + atual.preco)} reais \t vendas: ${e.vendas.map((e) => e.preco).toList()}');
  });

  print('\n16.1.9) List escopo de loops em objetos\n');

  List<Proprietario> proprietarios = List.empty(growable: true);
  proprietarios.add(Proprietario('Fernando', 'Rua dos Tolos, 0', [
    Carro('Honda', 'Civic', 'ABC1234', Caracteristicas('Passeio', 5, 130, 'Gasolina'), multas: [
      Multa('Excesso de velocidade', 'Gravíssima', 7),
      Multa('Estacionar Local Proíbido', 'Grave', 5),
    ]),
    Carro('Fiat', 'Palio', 'CBA4321', Caracteristicas('Passeio', 5, 103, 'Gasolina'), multas: [
      Multa('Excesso de velocidade', 'Gravíssima', 7),
      Multa('Excesso de velocidade', 'Grave', 5),
    ])
  ]));
  proprietarios.add(Proprietario('Leila', 'Rua dos Tolos, 0', [
    Carro('Honda', 'Civic', 'ABC1234', Caracteristicas('Passeio', 5, 130, 'Gasolina'), multas: [
      Multa('Excesso de velocidade', 'Gravíssima', 7),
      Multa('Estacionar Local Proíbido', 'Grave', 5),
    ]),
    Carro('Fiat', 'Palio', 'CBA4321', Caracteristicas('Passeio', 5, 103, 'Gasolina'), multas: [
      Multa('Excesso de velocidade', 'Gravíssima', 7),
      Multa('Excesso de velocidade', 'Grave', 5),
    ])
  ]));

  //proprietarios.sort((b, a) => a.nome.compareTo(b.nome));
  proprietarios.forEach(((e) => e.carros.forEach((e) => e.multas?.sort((a, b) => a.pontos.compareTo(b.pontos))))); //multas em ordem crescente
  for (var i = 0; i < proprietarios.length; i++) {
    var carros = proprietarios[i].carros;
    for (var carro in carros) {
      carro.multas?.forEach((e) {
        print('${proprietarios[i].nome} \t ${carro.modelo} ${carro.placa} ${carro.caracteristica.tipo} \t ${e.descricao} ${e.tipo} - ${e.pontos} pontos');
      });
    }
  }
}
