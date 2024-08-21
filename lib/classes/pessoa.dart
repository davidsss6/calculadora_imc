class Pessoa {
  final String nome;
  final double peso;
  final double altura;

  Pessoa({required this.nome, required this.peso, required this.altura});

  double calcularIMC() {
    if (altura <= 0) {
      throw ArgumentError('A altura deve ser maior que zero.');
    }
    if (peso <= 0) {
      throw ArgumentError('O peso deve ser maior que zero.');
    }
    return peso / (altura * altura);
  }
}
