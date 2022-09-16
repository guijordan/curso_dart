import 'dart:math';

class PessoaFactory {
  static final PessoaFactory instancia = new PessoaFactory._construtorNomeado('indefinido');
  String nome;

  factory PessoaFactory() => instancia;

  PessoaFactory._construtorNomeado(this.nome) {
    //Configurações iniciais
  }
}

class PessoaInstancia {
  static late PessoaInstancia _instancia; // retirar underline para usar o singleton.
  String nome;
  final int _identidade;

  factory PessoaInstancia({String nome = 'indefinido', int? identidade}) {
    identidade = (identidade == null) ? Random().nextInt(999999999 + 1) : identidade;
    _instancia = new PessoaInstancia._construtorNomeado(nome, identidade);
    return _instancia;
  }

  PessoaInstancia._construtorNomeado(this.nome, this._identidade) {
    //Configurações iniciais
  }

  get identidade => _identidade;
}
