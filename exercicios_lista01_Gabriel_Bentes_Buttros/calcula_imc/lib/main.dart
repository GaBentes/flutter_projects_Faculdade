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
      home: CalculadoraImc(),
    );
  }
}

class CalculadoraImc extends StatefulWidget {
  const new({super.key});

  @override
  State<CalculadoraImc> createState() => _CalculadoraImcState();
}

class _CalculadoraImcState extends State<CalculadoraImc> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  String mensagem = '';
  String classificacao = '';

  void calculaMedia() {
    double peso = double.tryParse(pesoController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;

    setState(() {
      double media = peso / (altura * altura);
      mensagem = 'IMC: ${media.toStringAsFixed(2)}';

      if (media < 18.5) {
        classificacao = 'Situação: Abaixo do peso';
      } else if (media >= 18.5 && media <= 24.9) {
        classificacao = 'Situação: Peso adequado';
      } else {
        classificacao = 'Situação: Acima do peso';
      }
    });
  }

  void limparDados() {
    setState(() {
      pesoController.clear();
      alturaController.clear();
      mensagem = '';
      classificacao = '';
    });
  }

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cálculo de IMC')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            TextField(
              controller: pesoController,
              decoration: InputDecoration(
                labelText: 'Peso',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: alturaController,
              decoration: InputDecoration(
                labelText: 'Altura',
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
              classificacao,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
