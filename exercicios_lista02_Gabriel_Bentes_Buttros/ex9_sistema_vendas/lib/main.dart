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
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();

  String mensagem = '';
  double precoSub = 0.0;
  double precoFinal = 0.0;

  void subTotal() {
    String nome = nomeController.text;
    double preco = double.tryParse(precoController.text) ?? 0.0;
    double desconto = 0.0;
    int qte = int.tryParse(quantidadeController.text) ?? 0;

    setState(() {
      precoSub = qte * preco;

      mensagem =
          "Produto: $nome \n"
          "Quantidade: $qte \n"
          "Sub total: R\$ ${precoSub.toStringAsFixed(2)} \n";

      if (precoSub >= 500.0) {
        desconto = precoSub * 0.10;
        precoFinal = precoSub - (desconto);
        mensagem +=
            "Desconto: R\$ ${desconto.toStringAsFixed(2)} \n"
            "Total: R\$ ${precoFinal.toStringAsFixed(2)} \n";
      } else if (precoSub == 0.0) {
        mensagem = "Preço não pode ser zero";
      } else {
        precoFinal = precoSub;
        mensagem +=
            "Desconto: R\$ ${desconto.toStringAsFixed(2)} \n"
            "Total: R\$ ${precoFinal.toStringAsFixed(2)} \n";
      }
    });
  }

  void limpaTela() {
    nomeController.clear();
    precoController.clear();
    quantidadeController.clear();

    setState(() {
      mensagem = "";
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
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
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: precoController,
              decoration: InputDecoration(
                labelText: 'Preço unitário',
                border: OutlineInputBorder(),
              ),
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
                ElevatedButton(onPressed: subTotal, child: Text('Calcular')),
                SizedBox(height: 10, width: 20),
                ElevatedButton(onPressed: limpaTela, child: Text('Limpar')),
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
