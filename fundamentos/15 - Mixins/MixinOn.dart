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
abstract class Artista {
  void acao() {
    print('Performista...');
  }
}

mixin Cantor on Artista {
  void acao() {
    print('Canta');
  }
}

class Dancarino {
  void acao() {
    print('Dança');
  }
}

abstract class Acao {
  void executar();
}

//Classes concretas

class Musico extends Artista with Dancarino, Cantor implements Acao {
  void acao() => print('Compoe'); //comente para ver a hierarquia de sobrescritas.
  @override
  void executar() {
    super.acao();
    acao();
  }
}

//A classe MC não pode cantar porque não extends de Artista.

class MC with Dancarino implements Acao {
  void acao() => print('Mixa.. bota o batidão'); //comente para ver a hierarquia de sobrescritas.
  @override
  void executar() {
    super.acao();
    acao();
  }
}

main() {
  print('15.1) Mixin On\n');
  Musico musico = Musico();
  musico.executar();

  print('');

  MC mc = MC();
  mc.executar();
}
