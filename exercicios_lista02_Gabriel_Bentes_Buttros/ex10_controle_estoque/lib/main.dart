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
      home: SistemaVenda(),
    );
  }
}

class SistemaVenda extends StatefulWidget {
  const new({super.key});

  @override
  State<SistemaVenda> createState() => _SistemaVendaState();
}

class _SistemaVendaState extends State<SistemaVenda> {
  final TextEditingController quantidadeController = TextEditingController();
  int estoque = 0;
  int qte = 0;
  String mensagem = '';

  void adicionaEstoque() {
    qte = int.tryParse(quantidadeController.text) ?? 0;
    setState(() {
      estoque += qte;
    });
  }

  void removeEstoque() {
    qte = int.tryParse(quantidadeController.text) ?? 0;
    setState(() {
      if (qte < 0) {
        estoque = 0;
      } else if (qte > estoque) {
        mensagem = "Não é possivel remover uma quantidade maior que a existente no estoque";
      } else {
        estoque -= qte;
      }
    });
  }

  void limpaTela() {
    quantidadeController.clear();

    setState(() {
      mensagem = "";
    });
  }

  @override
  void dispose() {
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sistema de venda')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Estoque: $estoque',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: quantidadeController,
              decoration: InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: adicionaEstoque,
                  child: Text('Adicionar'),
                ),
                SizedBox(height: 10, width: 20),
                ElevatedButton(
                  onPressed: removeEstoque,
                  child: Text('Remover'),
                ),
                SizedBox(height: 10, width: 20),
                ElevatedButton(onPressed: limpaTela, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 30),
            Text(mensagem, style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
