///
///Funções Arrow tem o retorno implícito.
///

funcaoArrow() {
  print('06.2) Funções Arrow\n');

  String conceito() => 'Função Arrow com retorno implícito!';

  String somarValores(int valorA, int valorB) => 'Soma: $valorA + $valorB = ${valorA + valorB}';

  String verificarMaioridade(String nome, int idade) => (idade >= 18) ? '$nome é maior de idade' : '$nome não é maior de idade';

  String calcularAreaDoCicrulo(double raio) => 'Área do círculo ${3.14 * raio * raio}';

  double desconto(int faltas) => (faltas > 1)
      ? 0.8
      : (faltas == 1)
          ? 0.9
          : 0;

  void calcularSalario(String nome, double salario, double bonus, int faltas) {
    var total = (salario * desconto(faltas) + bonus);
    print('Empregado: $nome salario: $total');
  }

  print(conceito());
  print(somarValores(2, 3));
  print(verificarMaioridade('Fernando', 36));
  print(calcularAreaDoCicrulo(2));
  calcularSalario('Fernando', 900, 100, 2);
}

void main() {
  funcaoArrow();
}
