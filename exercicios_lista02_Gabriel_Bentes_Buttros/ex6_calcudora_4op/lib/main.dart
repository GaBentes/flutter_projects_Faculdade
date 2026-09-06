import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const new({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController valor1Controller = TextEditingController();
  final TextEditingController valor2Controller = TextEditingController();

  double numero1 = 0;
  double numero2 = 0;

  String mensagem = '';

  void soma() {
    numero1 = double.tryParse(valor1Controller.text) ?? 0;
    numero2 = double.tryParse(valor2Controller.text) ?? 0;

    setState(() {
      double soma = numero1 + numero2;
      mensagem = "A soma é $soma";
    });
  }

  void subtracao() {
    setState(() {
      double subtracao = numero1 - numero2;
      mensagem = "A subtração é $subtracao";
    });
  }

  void multiplicacao() {
    setState(() {
      double multiplicacao = numero1 * numero2;
      mensagem = "A multiplicação é $multiplicacao";
    });
  }

  void divisao() {
    setState(() {
      if (numero2 > 0) {
        double divisao = numero1 / numero2;
        mensagem = "A divisão é $divisao";
      } else {
        mensagem = "Erro: O segundo número não pode ser 0";
      }
    });
  }

  void limparDados() {
    setState(() {
      valor1Controller.clear();
      valor2Controller.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    valor1Controller.dispose();
    valor2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora quatro operações')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            TextField(
              controller: valor1Controller,
              decoration: InputDecoration(
                labelText: 'Valor 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: valor2Controller,
              decoration: InputDecoration(
                labelText: 'Valor 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: soma, child: Text('+')),
                SizedBox(height: 10, width: 10),
                ElevatedButton(onPressed: subtracao, child: Text('-')),
                SizedBox(height: 10, width: 10),
                ElevatedButton(onPressed: multiplicacao, child: Text('×')),
                SizedBox(height: 10, width: 10),
                ElevatedButton(onPressed: divisao, child: Text('÷')),
                SizedBox(height: 10, width: 10),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: limparDados, child: Text('Limpar dados')),
            SizedBox(height: 20),
            Text(mensagem, style: TextStyle(fontSize: 20)),
          ], //children
        ),
      ),
    );
  }
}
