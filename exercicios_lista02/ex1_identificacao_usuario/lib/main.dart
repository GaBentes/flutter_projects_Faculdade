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
      home: IdentificacaoUsuario(),
    );
  }
}

class IdentificacaoUsuario extends StatefulWidget {
  const new({super.key});

  @override
  State<IdentificacaoUsuario> createState() => _IdentificacaoUsuario();
}

class _IdentificacaoUsuario extends State<IdentificacaoUsuario> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  String mensagem = '';

  void mostrarTela() {
    String nome = nomeController.text;
    String cidade = cidadeController.text;

    setState(() {
      mensagem = "Olá, $nome! Você mora em $cidade.";
    });
  }

  void limparTela() {
    nomeController.clear();
    cidadeController.clear();
    setState(() {
      mensagem = "";
    });
  }

  void disposer(){
    nomeController.dispose();
    cidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Identificação de usuário')),
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
              controller: cidadeController,
              decoration: InputDecoration(
                labelText: 'Cidade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: mostrarTela, child: Text('Enviar')),
                SizedBox(height: 20, width: 20),
                ElevatedButton(onPressed: limparTela, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 20),
            Text(
              mensagem,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
