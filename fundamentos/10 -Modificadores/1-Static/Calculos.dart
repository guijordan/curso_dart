class Calculos {
  double pi = 3.14;
  static double piEstatico = 3.14;

  double areaDoCirculo(double raio) {
    return pi * (raio * raio);
  }

  static double areaDoCirculoEstatico(double raio) {
    return piEstatico * (raio * raio);
  }
}
