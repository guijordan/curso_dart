/*
  * Singleton 
  - é um padrão de projeto para que exista apenas uma instância da classe
  - O construtor nomeado privato sem o construtor default impede de instanciar a classe
  * Static
  - A instancia pode ser acessada diretamente.
  */

import 'PessoaStatic.dart';

void main() {
  print('11.1) Singletons Static\n');
  print(PessoaStatic.instancia.nome);
  PessoaStatic.instancia.nome = 'Fernando';
  var p1 = PessoaStatic.instancia;
  var p2 = PessoaStatic.instancia;
  p1.nome = 'Leila';
  print(PessoaStatic.instancia.nome);
  p2.nome = 'Chloe';
  print(PessoaStatic.instancia.nome);
  print(identical(p1, p2));
  print(p2 == PessoaStatic.instancia);
}
