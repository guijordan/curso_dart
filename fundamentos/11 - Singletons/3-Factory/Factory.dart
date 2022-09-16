/*
  *Singleton
  - É um padrão de projeto para que exista apenas uma instância de classe
  - O construtor nomeado privado sem o construtor default impede de instanciar a classe.

  *Factory
  - Construtor factory é usado para retornar/manter a instancia original.
  - Construtor factory é capaz de retornar valores.
*/

import 'PessoaFactory.dart';

singletonFactory() {
  print('11.3) Singletons Factory\n');

  var p1 = new PessoaFactory();
  print(p1.nome);
  p1.nome = 'Fernando';
  print(PessoaFactory.instancia.nome);
  PessoaFactory.instancia.nome = 'Leila';
  print(p1.nome);
  var p2 = PessoaFactory();
  p2.nome = 'Chloe';
  print(PessoaFactory.instancia.nome);
  print(identical(p1, PessoaFactory.instancia));

  print(p2 == PessoaFactory.instancia);
}

singletonInstancia() {
  print('\n11.4) Singleton Instancia');
  var p1 = new PessoaInstancia(nome: 'Fernando');
  print('nome: ${p1.nome} id: ${p1.identidade}');
  var p2 = PessoaInstancia(nome: 'Leila', identidade: 12345678);
  print('nome: ${p2.nome} id: ${p2.identidade}');
  p2.nome = 'Fernando Martins';
  print('nome: ${p1.nome} id: ${p1.identidade}');
  print(identical(p1, p2));
  //print(p2 == PessoaInstancia._instancia);
}

void main() {
  singletonFactory();
  singletonInstancia();
}
