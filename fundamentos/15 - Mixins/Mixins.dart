/*
  * Conceito
  - Mixin Permite implementar métodos e atributos de outras classes

  * Regras
  - Devem ser implementados antes das interfaces
  - Podem ser implementados a partir de uma classe concreta ou abstrata
  - Não pode implementar uma classes que estenda e estender de uma classe mixin
  - Pode implementar mais de um mixin, e não é obrigatório usar todos métodos de atributos
  - As classes que possuem métodos iguais serão sobrescritas em ordem até a classe herdeira

  * ON
  - É obrigatório declarar sua classe como mixin
  - Restringe o uso do mixin as classes que estendem ou implementam a classe declarada
  */
void main() {
  print('15.0 ) Mixin\n');
  var bolsonaro = Candidato('Bolsonaro', ideologia: 'Direito', partido: 'PSL');
  bolsonaro
    ..objetivo = 'Ganhar Eleição'
    ..objetivosPessoais()
    ..postagem = 'Vou acabar com a corrupção no Brasil!'
    ..escreverPostagem()
    ..depositar = 396000
    ..prestacaoContas();
}

class Candidato extends Cidadao with Elegivel, Conta implements Postagem, Presidenciavel {
  String? objetivo;
  Candidato(String nome, {this.ideologia, this.partido}) : super(nome) {
    direitosEDeveres();
  }

  @override
  void objetivosPessoais() {
    print('$nome tem o objetivo de $objetivo');
  }

  //INTERFACES
  @override
  String? postagem;

  @override
  void escreverPostagem() {
    print('Postagem de $nome no facebook $postagem');
  }

  @override
  String? ideologia;

  @override
  String? partido;

  @override
  void ideologiaPolitica() {
    print('$nome é candidato com ideologia de $ideologia pelo partido $partido');
  }

  //mixins
  @override
  void prestacaoContas() {
    elegivel = super.declaracaoRenda();
    if (elegivel) {
      print('Candidato $nome passou na prestação de contas !\nAutorizado a concorrer na eleições 2018');
    } else {
      print('Candidato $nome foi barrado na prestação de contas!\nSaldo $saldo excede a renda declarada para Presidente!');
    }
  }
}

abstract class Presidenciavel {
  String? partido;
  String? ideologia;

  void ideologiaPolitica();
}

class Postagem {
  String? postagem;
  void escreverPostagem() {
    print('');
  }
}

mixin Elegivel on Cidadao {
  bool elegivel = false;
  void prestacaoContas();
}

abstract class Conta {
  late double _saldo, salario = 33000;
  get saldo => this._saldo;
  set depositar(double valor) => this._saldo = valor;
  bool declaracaoRenda() => _saldo / 12 < salario;
}

abstract class Cidadao {
  String nome;

  Cidadao(this.nome);

  void objetivosPessoais();

  void direitosEDeveres() {
    print('Todo cidadão tem direitos e deveres');
  }
}
