class Pessoa {
  static final Map<String, Pessoa> _pessoas = Map();
  final String nome;
  int? idade;
  double? peso;

  factory Pessoa(String nome, {int? idade, double? peso}) {
    if (_pessoas.containsKey(nome)) {
      return _pessoas[nome] as Pessoa;
    }
    final novaPessoa = Pessoa._construtorPrivado(nome, idade, peso);
    _pessoas[nome] = novaPessoa;
    return novaPessoa;
  }

  Pessoa._construtorPrivado(this.nome, this.idade, this.peso);

  static void mostrarDetalhes(String nome) {
    if (_pessoas.containsKey(nome)) {
      print('DETALHES: nome: $nome idade: ${_pessoas[nome]!.idade} peso: ${_pessoas[nome]!.peso}');
    } else {
      print('"${nome} não existe no map de Pessoas"');
    }
  }

  static void alterarDetalhes(String nome, {int? idade, double? peso}) {
    if (_pessoas.containsKey(nome)) {
      _pessoas[nome]!.idade = idade;
      _pessoas[nome]!.peso = peso;
      print('ALTERACAO: nome: $nome idade: ${_pessoas[nome]!.idade} peso: ${_pessoas[nome]!.peso}');
    } else {
      print('"${nome} não existe no map de Pessoas"');
    }
  }

  static void mostrarPessoas() {
    print('PESSOAS: $_pessoas');
    _pessoas.forEach((chave, valor) => print('forEach: $chave: ${valor.idade}, ${valor.peso}'));
  }

  @override
  String toString() {
    return "${this.nome} : ${this.idade}";
  }
}
