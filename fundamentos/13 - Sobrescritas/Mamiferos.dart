import 'Animal.dart';

abstract class Mamiferos extends Animal {
  String sexo;
  late String desenvolvimento;

  Mamiferos.placentarios(this.sexo, idade, {docil}) : super.vertebrados(idade, docil: docil) {
    this.desenvolvimento = 'Placentários';
  }

  Mamiferos.marsupiais(this.sexo, idade, {docil}) : super.vertebrados(idade, docil: docil) {
    this.desenvolvimento = 'Placentários + Bolsa Externa';
  }

  Mamiferos.monotremados(this.sexo, idade, {docil}) : super.vertebrados(idade, docil: docil) {
    this.desenvolvimento = 'Ovo';
  }

  void alimentar() {
    print('Se Alimenta');
    print('Como um');
  }

//Métodos sem escopo em classes abstratas devem ser sobrescritos em classes herdeiras
  void reproduzir();
}
