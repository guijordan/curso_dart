abstract class Animal {
  String idade;
  bool docil;
  late bool coluna;

  Animal.vertebrados(this.idade, {this.docil = false}) {
    this.coluna = true;
  }

  Animal.invertebrados(this.idade, {this.docil = false}) {
    this.coluna = false;
  }

  void dormir() {
    print('Dorme como um animal!');
  }
}
