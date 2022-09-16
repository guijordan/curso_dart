class Animal {
  late String nome;
  String? raca;
  int? idade;

  Animal(String nome, [String? raca, int idade = 0]) {
    this.nome = nome;
    this.raca = raca;
    this.idade = idade;
    print('Construtor com parametros default ! ${this.toString()}');
  }
}
