import 'Mamiferos.dart';

class Cao extends Mamiferos {
  String nome;
  String raca;

  Cao.domestico(this.nome, this.raca, String sexo, {String idade = 'Indefinida', bool docil = true}) : super.placentarios(sexo, idade, docil: docil);

  Cao.selvagem(this.nome, this.raca, String sexo, {idade = 'Indefinida', docil = false}) : super.placentarios(sexo, idade, docil: docil);

  @override //Sobrescreve um método da classe herdade (super)
  void dormir() {
    print('Dorme como um cao !');
  }

  // @override // É opcional a sintaxe override
  void alimentar() {
    super.alimentar(); //Implementa o escopo do método herdado (super)
    print('cao!');
  }

  @override //Métodos sem escopo em classes abstratas devem ser sobrescritos.
  void reproduzir() {
    print('Reproduz como um cao!');
  }

  void acao() {
    print('Late como um cao!');
  }

  //toda classe extends de Object, ao usar a função print a função toString retorna (instance of 'Object')
  String toString() {
    return "Instance of '${this.runtimeType}' nome: $nome raca: $raca sexo: $sexo";
  }
}
