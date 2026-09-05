import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculadoraMedia(),
    );
  }
}

class CalculadoraMedia extends StatefulWidget {
  const new({super.key});

  @override
  State<CalculadoraMedia> createState() => _CalculadoraMediaState();
}

class _CalculadoraMediaState extends State<CalculadoraMedia> {
  final TextEditingController nota1Controller = TextEditingController();
  final TextEditingController nota2Controller = TextEditingController();
  final TextEditingController nota3Controller = TextEditingController();

  String mensagem = '';
  String aprovado = '';

  void calculaMedia() {
    double n1 = double.tryParse(nota1Controller.text) ?? 0;
    double n2 = double.tryParse(nota2Controller.text) ?? 0;
    double n3 = double.tryParse(nota3Controller.text) ?? 0;

    setState(() {
      double media = (n1 + n2 + n3) / 3;
      mensagem = 'Média: ${media.toStringAsFixed(1)}';

      if (media >= 6) {
        aprovado = 'Situação: Aprovado';
      } else {
        aprovado = 'Situação: Reprovado';
      }
    });
  }

  void limparDados() {
    setState(() {
      nota1Controller.clear();
      nota2Controller.clear();
      nota3Controller.clear();
      mensagem = '';
      aprovado = '';
    });
  }

  @override
  void dispose() {
    nota1Controller.dispose();
    nota2Controller.dispose();
    nota3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de Média')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            TextField(
              controller: nota1Controller,
              decoration: InputDecoration(
                labelText: 'Nota 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nota2Controller,
              decoration: InputDecoration(
                labelText: 'Nota 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nota3Controller,
              decoration: InputDecoration(
                labelText: 'Nota 3',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: calculaMedia, child: Text('Calcula')),
                SizedBox(height: 10, width: 10),
                ElevatedButton(onPressed: limparDados, child: Text('Limpa')),
              ],
            ),
            SizedBox(height: 30),
            Text(mensagem, style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(
              aprovado,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}