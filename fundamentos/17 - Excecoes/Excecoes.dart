/**
 * * TRATAMENTO DE EXCECAO!
 * - try: Usado para testar uma lógica
 * - catch: Captura erros na lógica try
 * - on: Captura específicos/conhecidos na lógica try
 * - throw Exception: Exceção criada pelo usuário e tratada no catch.
 * - finally: Executado ao final do try/catch, com exceção ou não! Utilizado para liberar recursos na lógica try.
 */

///
///CASO1: Quando você desconhece a excecao, use a clausula TRY CATCH.
///
caso1() {
  print('17.0.1) Try Catch\n');

  try {
    int resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  } catch (e) {
    print('Excecao: $e');
  }
}

///
///CASO 2: Quando vc conhece a execao, use a clausula ON
///
caso2() {
  print('17.0.2) ON\n');

  try {
    int resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  } on UnsupportedError {
    print('Excecao: Não é possível dividir por zero!');
  } catch (e) {
    print('Excecao: $e');
  }
}

///
///CASO 3: Para descobrir eventos ocorridos antes da excecao, use Stack Trace
///
caso3() {
  print('17.0.3) StackTrace\n');

  try {
    int resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  } catch (e, s) {
    print('Excecao: $e');
    print('Stack Trace: $s');
  }
}

///
///CASO 4: Use finally para tratamentos após execução do Try Catch, usada pra liberar recurso utilizados na lógica try catch.
///
caso4() {
  print('17.0.4) Finally\n');

  try {
    int resultado = 1 ~/ 0;
    print('Resultado: $resultado');
  } catch (e) {
    print('Excecao: $e');
  } finally {
    print('finally: Com ou sem exceção, finally será executado!');
  }
}

caso5() {
  print('17.0.5) Throw Exception\n');

  try {
    int valorA = 1, valorB = 0;
    double resultado = valorA / valorB;
    if (resultado.isInfinite) {
      throw Exception('A variavel valorB deve ser deve ser != 0');
    }
    print('Resultado: $resultado');
  } catch (e) {
    print('Excecao: $e');
  } finally {
    print('finally: Com ou sem exceção, finally será executado!');
  }
}

main() {
  print('17.0.0) Tratamento de Execoes\n');
  caso1();
  caso2();
  caso3();
  caso4();
  caso5();
}
