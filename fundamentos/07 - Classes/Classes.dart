import 'Conta.dart';
import 'Pessoa.dart';
import 'Usuario.dart';

///
///Classes => Objetos
///Variaveis => atrubutos
///Funcoes => métodos.
///
void main() {
  print('07.0) Classes/Objetos\n');
  Pessoa pessoa1 = new Pessoa();
  pessoa1.nome = 'Fernando';
  pessoa1.idade = 36;
  print('Nome: ${pessoa1.nome} idade ${pessoa1.idade}\n');

  Pessoa pessoa2 = Pessoa();
  pessoa2.nome = 'Leila';
  pessoa2.idade = 31;
  print('Nome: ${pessoa2.nome} idade: ${pessoa2.idade}\n');

//Operador em cascata permite emitir varias chamadas por meio de um objeto.
  var pessoa3 = Pessoa();
  pessoa3
    ..nome = 'Chloe'
    ..idade = 1
    ..info();

  //Dados inseridos pelo usuário
  Usuario usuario = new Usuario();
  usuario.usuario = 'fma@gmail.com';
  usuario.senha = '123456';
  usuario.autenticar();

  Conta conta = new Conta();
  print('Nome: ${conta.nome} Nº Conta: ${conta.numeroConta} Saldo: ${conta.consultarSaldo()}');
  conta.calcularSalario(950, 150, 2);
  conta.depositar(150);
  conta.sacar(50);
}
