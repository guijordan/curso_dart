import 'Mamiferos.dart';

class Cao extends Mamiferos {
  String nome;
  String raca;

  Cao(this.nome, this.raca, String sexo, {String? idade, bool docil = false}) : super(sexo, idade, docil) {}

  void acao() {
    print('Late como um cao');
  }
}
