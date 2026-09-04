import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TelaContador());
  }
}

class TelaContador extends StatefulWidget {
  const new({super.key});

  @override
  State<TelaContador> createState() => _TelaContadorState();
}

class _TelaContadorState extends State<TelaContador> {
  int numero = 0;

  void aumentarValor() {
    setState(() {
      numero++;
    });
  }

  void diminuirValor() {
    setState(() {
      if (numero > 0) {
        numero--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Valor atual: ', style: TextStyle(fontSize: 20)),
            Text(
              '$numero',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: diminuirValor, child: Text('-')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: aumentarValor, child: Text('+')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
