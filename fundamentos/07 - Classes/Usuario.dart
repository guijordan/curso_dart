class Usuario {
  String? usuario;
  String? senha;

  void autenticar() {
    var usuario = 'fma@gmail.com';
    var senha = '123456';

    if (this.usuario == usuario && this.senha == senha) {
      print('Usuário Autenticado !\n');
    } else {
      print('Usuário Não Autenticado !\n');
    }
  }
}
