class Usuario {
  bool alteracao = false;
  late String nome;
  late String _senha;

  Usuario(this.nome, String senha) {
    this._senha = senha;
  }

  //getter Padrão
  String get senha {
    return _senha;
  }
  //setter padrão

  set senha(String senha) {
    if (alteracao) {
      _senha = senha;
      print('Sucesso:senha alterada');
    } else {
      print('Erro: Acesso Negado!');
    }
  }
}
