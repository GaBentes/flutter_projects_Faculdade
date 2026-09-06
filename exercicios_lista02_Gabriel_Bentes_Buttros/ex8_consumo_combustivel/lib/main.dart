import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConsumoCombustivel(),
    );
  }
}

class ConsumoCombustivel extends StatefulWidget {
  const ConsumoCombustivel({super.key});

  @override
  State<ConsumoCombustivel> createState() => _ConsumoCombustivelState();
}

class _ConsumoCombustivelState extends State<ConsumoCombustivel> {
  final TextEditingController distanciaController = TextEditingController();
  final TextEditingController combustivelController = TextEditingController();

  String mensagem = '';

  void calcular() {
    double distancia = double.tryParse(distanciaController.text) ?? 0;
    double combustivel = double.tryParse(combustivelController.text) ?? 0;
    setState(() {
      if (combustivel > 0) {
        double consumo = distancia / combustivel;
        if (consumo >= 12) {
          mensagem =
              "Consumo médio: ${consumo.toStringAsFixed(1)} km/L\n"
              "Classificação: Econômico";
        } else {
          mensagem =
              "Consumo médio: ${consumo.toStringAsFixed(1)} km/L\n"
              "Classificação: Consumo elevado";
        }
      }
    });
  }

  void limparDados() {
    setState(() {
      distanciaController.clear();
      combustivelController.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    distanciaController.dispose();
    combustivelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consumo de combustível')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: distanciaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Distância percorrida (km)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: combustivelController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Combustível utilizado (litros)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: calcular, child: Text('Calcular')),

                SizedBox(width: 10),

                ElevatedButton(onPressed: limparDados, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 20),
            Text(mensagem, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
