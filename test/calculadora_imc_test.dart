import 'package:calculadora_imc/classes/pessoa.dart';
import 'package:test/test.dart';
import 'package:calculadora_imc/calculadora_imc.dart';

void main() {
  group('Calculadora IMC - Testes com Exceções', () {
    test('Calcula o IMC corretamente para valores válidos', () {
      var pessoa = Pessoa(nome: 'Teste', peso: 70, altura: 1.75);
      expect(pessoa.calcularIMC(), closeTo(22.86, 0.01));
    });

    test('Retorna exceção ao tentar calcular IMC com peso zero', () {
      var pessoa = Pessoa(nome: 'Teste', peso: 0, altura: 1.75);
      expect(() => pessoa.calcularIMC(), throwsA(isA<ArgumentError>()));
    });

    test('Retorna exceção ao tentar calcular IMC com altura zero', () {
      var pessoa = Pessoa(nome: 'Teste', peso: 70, altura: 0);
      expect(() => pessoa.calcularIMC(), throwsA(isA<ArgumentError>()));
    });

    test('Retorna exceção ao tentar calcular IMC com altura negativa', () {
      var pessoa = Pessoa(nome: 'Teste', peso: 70, altura: -1.75);
      expect(() => pessoa.calcularIMC(), throwsA(isA<ArgumentError>()));
    });

    test('Retorna exceção ao tentar calcular IMC com peso negativo', () {
      var pessoa = Pessoa(nome: 'Teste', peso: -70, altura: 1.75);
      expect(() => pessoa.calcularIMC(), throwsA(isA<ArgumentError>()));
    });

    test('Verifica cálculo de IMC para valores de peso e altura muito baixos', () {
      var pessoa = Pessoa(nome: 'Teste', peso: 1, altura: 0.5);
      expect(pessoa.calcularIMC(), closeTo(4, 0.01));
    });

    test('Verifica cálculo de IMC para valores de peso e altura muito altos', () {
      var pessoa = Pessoa(nome: 'Teste', peso: 500, altura: 2.5);
      expect(pessoa.calcularIMC(), closeTo(80, 0.01));
    });
  });
}



