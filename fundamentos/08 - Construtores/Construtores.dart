import 'Animal.dart';
import 'Objeto.dart';
import 'Pessoa.dart';
import 'Usuario.dart';

///Os construtores devem ter o mesmo nome da classe e eles são iniciados quando instanciamos as classes
///podendo fazer configurações iniciais.
///
void main() {
  print('08.0) Construtores \n');
  Objeto objeto = new Objeto();
  objeto.nome = 'mesa';
  print('nome: ${objeto.nome}\n');

  Animal animal = new Animal('Chloe', 'Pug');
  print('nome: ${animal.nome} Raça: ${animal.raca} Idade: ${animal.idade}\n');

  Pessoa pessoa = Pessoa('Fernando', 36, altura: 1.83);
  print('nome: ${pessoa.nome} idade: ${pessoa.idade} cor: ${pessoa.cor} altura: ${pessoa.altura}\n');

//dados inseridos pelo usuário
  Usuario usuario = Usuario('fmda@gmail.com', 'abc123', nome: 'Fernando');
  print('Usuário: ${usuario.user} senha: ${usuario.senha} nome: ${usuario.nome} cargo:${usuario.cargo}');
  usuario.autenticar();

  Usuario admin = Usuario.admin('fmda@gmail.com', 'abc123', nome: 'Fernando');
  print('Admin: ${admin.user} senha: ${admin.senha} nome: ${admin.nome} cargo:${admin.cargo}');
  admin.autenticar();
}
