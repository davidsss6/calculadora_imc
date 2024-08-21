import 'dart:io';

import 'package:calculadora_imc/classes/pessoa.dart';

void main() {
  try {
    stdout.write("Digite o seu nome: ");
    String? nome = stdin.readLineSync();
    if (nome == null || nome.isEmpty) {
      throw FormatException('Nome não pode estar em branco.');
    }

    stdout.write("Digite o seu peso (em kg): ");
    String? pesoInput = stdin.readLineSync();
    if (pesoInput == null || pesoInput.isEmpty) {
      throw FormatException('Peso não pode estar em branco.');
    }
    double peso = double.parse(pesoInput);

    stdout.write("Digite a sua altura (em metros): ");
    String? alturaInput = stdin.readLineSync();
    if (alturaInput == null || alturaInput.isEmpty) {
      throw FormatException('Altura não pode estar em branco.');
    }
    double altura = double.parse(alturaInput);

    Pessoa pessoa = Pessoa(nome: nome, peso: peso, altura: altura);
    double imc = pessoa.calcularIMC();

    print("\n${pessoa.nome}, seu IMC é ${imc.toStringAsFixed(2)}");

    if (imc < 18.5) {
      print("Você está abaixo do peso.");
    } else if (imc >= 18.5 && imc < 24.9) {
      print("Você está com peso normal.");
    } else if (imc >= 25 && imc < 29.9) {
      print("Você está com sobrepeso.");
    } else {
      print("Você está obeso.");
    }
  } on FormatException catch (e) {
    print("Erro de Formato: ${e.message}");
  } on ArgumentError catch (e) {
    print("Erro de Argumento: ${e.message}");
  } catch (e) {
    print("Erro: Algo deu errado. (${e.toString()})");
  }
}
