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
      home: AntecessorSucessor(),
    );
  }
}

class AntecessorSucessor extends StatefulWidget {
  const new({super.key});

  @override
  State<AntecessorSucessor> createState() => _AntecessorSucessorState();
}

class _AntecessorSucessorState extends State<AntecessorSucessor> {
  TextEditingController numeroController = TextEditingController();

  String mensagem = "";

  void mostraNumeros() {
    int numero = int.tryParse(numeroController.text) ?? 0;
    int antecessor = 0;
    int sucessor = 0;

    setState(() {
      antecessor = numero - 1;
      sucessor = numero + 1;
      mensagem =
          "Numero escolhido: $numero \n Seu antecessor: $antecessor \n Seu sucessor: $sucessor";
    });
  }

  void limpaTela() {
    numeroController.clear();
    setState(() {
      mensagem = "";
    });
  }

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Antecessor e sucessor')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              decoration: InputDecoration(
                labelText: 'Numero',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: mostraNumeros,
                  child: Text('Verifica'),
                ),
                SizedBox(height: 20, width: 20),
                ElevatedButton(
                  onPressed: limpaTela,
                  child: Text('Limpa campos'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(mensagem, style: TextStyle(fontSize: 20,)),
          ],
        ),
      ),
    );
  }
}
