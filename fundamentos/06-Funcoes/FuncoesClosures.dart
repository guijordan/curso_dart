///
///Uma closure ocorre quando uma função é declarada dentro do corpo de uma outra função !
///Podendo retornar as variaveis locais e da função superior.
///
funcaoClosures() {
  print('06.5.1) Closures sem retorno\n');
  var saudacao = (String nome) {
    var mensagem = (complemento) => print('Olá $nome! $complemento');
    mensagem('Seja Bem vindo!');
  };
  print(saudacao);
  saudacao('Fernando');

  print('06.5.1) Closures com retorno\n');

  Function somar(int valorA) {
    print(valorA);
    return (double valorB) {
      print(valorB);
      return valorA + valorB;
    };
  }

  var somarDez = somar(10);
  print(somarDez);
  print(somarDez(5.0));

  Function porcentagem(desconto) => (valor) => desconto * valor;
  var descontarDez = porcentagem(0.9);
  var descontarVinte = porcentagem(0.8);
  print(descontarDez(100));
  print(descontarVinte(200));

  print('06.5.1) Closures com Objetos\n');

  var novoObjeto = () {
    var id = 0;
    var objetoCriado = (String nome, descricao) {
      //return 'id: ${(++id).toString().padLeft(2, '0')} nome: $nome, descricao: $descricao'; //retornar para um array;
      //return {'id': (++id).toString().padLeft(2, '0'), 'nome': nome, 'descricao': descricao};
      return Objeto.fromMap({'id': (++id).toString().padLeft(2, '0'), 'nome': nome, 'descricao': descricao});
    };
    return objetoCriado;
  };

  var objeto = novoObjeto();
  print(objeto);

  var listaObjetos = [objeto('Fernando', 1.99)];
  listaObjetos.add(objeto('iPhone', 3000));
  listaObjetos.add(objeto('Fones', 100));

  for (var objeto in listaObjetos) {
    //print(objeto.substring(7));
    //print(objeto.map((c, v) => MapEntry(c, v is double ? '${descontarDez(v)}' : v)));
    print((objeto.descricao is num) ? descontarVinte(objeto.descricao) : objeto.descricao);
  }
}

class Objeto {
  String? id, nome;
  dynamic descricao;
  Objeto({this.id, this.nome, this.descricao});
  factory Objeto.fromMap(Map<String, dynamic> map) {
    return Objeto(id: map['id'].toString(), nome: map['nome'], descricao: map['descricao']);
  }
}

void main() {
  funcaoClosures();
}
