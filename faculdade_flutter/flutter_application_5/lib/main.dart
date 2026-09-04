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
      home: TelaCadastro(),
    );
  }
}

class TelaCadastro extends StatefulWidget {
  const new({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();

  String mensagem = '';

  void mostrarDados() {
    String nome = nomeController.text;
    String idade = idadeController.text;
    setState(() {
      mensagem = 'Olá, $nome! Você tem $idade anos.';
    });
  }

  void limparDados() {
    setState(() {
      nomeController.clear();
      idadeController.clear();
      mensagem = '';
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
      appBar: AppBar(title: Text('Cadastro')),
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
            SizedBox(height: 15),
            TextField(
              controller: idadeController,
              decoration: InputDecoration(
                labelText: 'Idade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: mostrarDados,
                  child: Text('Mostrar dados'),
                ),
                SizedBox(height: 10, width: 10),
                ElevatedButton(
                  onPressed: limparDados,
                  child: Text('Limpar dados'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(mensagem, style: TextStyle(fontSize: 20)),
          ], //children
        ),
      ),
    );
  }
}
