import 'package:flutter/material.dart';
 
void main() {
  runApp(MeuApp());
}
 
class MeuApp extends StatelessWidget {
  const new({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TelaCadastro());
  }
}
 
class TelaCadastro extends StatefulWidget {
  const new({super.key});
 
  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}
 
class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController nomeController = TextEditingController();
  String mensagem = '';
 
  void mostrarNome() {
    setState(() {
      mensagem = 'Olá, ${nomeController.text}!';
    });
  }
 
  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Digite seu nome:',
                border: OutlineInputBorder(),
              ),
            ),
 
            SizedBox(height: 20),
            ElevatedButton(onPressed: mostrarNome, child: Text('Confirmar')),
            SizedBox(height: 30),
            Text(mensagem, style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}