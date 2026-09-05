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
      home: ConversorTemperatura(),
    );
  }
}

class ConversorTemperatura extends StatefulWidget {
  const new({super.key});

  @override
  State<ConversorTemperatura> createState() => _ConversorTemperaturaState();
}

class _ConversorTemperaturaState extends State<ConversorTemperatura> {
  final TextEditingController grausController = TextEditingController();
  final TextEditingController farenheitController = TextEditingController();

  void converteTemp() {
    double temp = double.tryParse(grausController.text) ?? 0.0;
    setState(() {
      double tempConvertido = (temp * 9 / 5) + 32;
      farenheitController.text = tempConvertido % 1 == 0
          ? '${tempConvertido.toInt()}°F'
          : '$tempConvertido°F';
    });
  }

  void limpaTela() {
    setState(() {
      grausController.clear();
      farenheitController.clear();
    });
  }

  @override
  void dispose() {
    grausController.dispose();
    farenheitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversor de temperatura')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            TextField(
              controller: grausController,
              decoration: InputDecoration(
                labelText: 'Celsius',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: converteTemp,
                  child: Text('Converter'),
                ),
                SizedBox(height: 10, width: 20),
                ElevatedButton(
                  onPressed: limpaTela,
                  child: Text('Limpar dados'),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              // readOnly: true,
              controller: farenheitController,
              decoration: InputDecoration(
                labelText: 'Fahrenheit',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
