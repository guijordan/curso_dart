class Usuario {
  String? user, senha, nome, cargo;
  int idade = 0;
  Usuario(this.user, this.senha, {this.nome, String? cargo}) {
    this.nome = (nome == null) ? 'semnome' : nome;
    this.cargo = (cargo == null) ? 'Usuario' : cargo;
    print('Construtor resumido com parametros nomeados default!: ${this.toString()}\n');
  }

  Usuario.admin(this.user, this.senha, {this.nome}) {
    this.nome = (nome == null) ? 'semnome' : nome;
    this.cargo = 'Administrador';
    print('Construtor resumido com parametros nomeados default!: ${this.toString()}\n');
  }

  void autenticar() {
    //dados recuperados do banco de dados;
    var user = 'fmda@gmail.com';
    var senha = 'abc123';
    (this.user == user && this.senha == senha) ? print('Usuário Autenticado !') : print('Usuário não autenticado');
  }
}
