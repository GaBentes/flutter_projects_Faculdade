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
      home: VerificadorIdade(),
    );
  }
}

class VerificadorIdade extends StatefulWidget {
  const new({super.key});

  @override
  State<VerificadorIdade> createState() => _VerificadorIdadeState();
}

class _VerificadorIdadeState extends State<VerificadorIdade> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();

  String mensagem = "";

  void verificaIdade() {
    String nome = nomeController.text;
    int idade = int.tryParse(idadeController.text) ?? 0;

    setState(() {
      if (idade >= 18) {
        mensagem = "$nome é maior de idade.";
      } else {
        mensagem = "$nome é menor de idade";
      }
    });
  }

  void limpaTela() {
    nomeController.clear();
    idadeController.clear();

    setState(() {
      mensagem = "";
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verificador de idade')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: idadeController,
              decoration: InputDecoration(
                labelText: 'Idade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: verificaIdade,
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
            Text(mensagem),
          ],
        ),
      ),
    );
  }
}
