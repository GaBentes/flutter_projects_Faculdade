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
      home: ReajusteSalarial(),
    );
  }
}

class ReajusteSalarial extends StatefulWidget {
  const ReajusteSalarial({super.key});

  @override
  State<ReajusteSalarial> createState() => _ReajusteSalarialState();
}

class _ReajusteSalarialState extends State<ReajusteSalarial> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController salarioController = TextEditingController();
  final TextEditingController percentualController = TextEditingController();

  String mensagem = '';

  void calcular() {
    String nome = nomeController.text;

    double salario = double.tryParse(salarioController.text) ?? 0;

    double percentual = double.tryParse(percentualController.text) ?? 0;

    setState(() {
      double aumento = salario * percentual / 100;
      double novoSalario = salario + aumento;

      mensagem =
          "Funcionário: $nome\n"
          "Salário atual: R\$ ${salario.toStringAsFixed(2)}\n"
          "Aumento: R\$ ${aumento.toStringAsFixed(2)}\n"
          "Novo salário: R\$ ${novoSalario.toStringAsFixed(2)}";
    });
  }

  void limparDados() {
    setState(() {
      nomeController.clear();
      salarioController.clear();
      percentualController.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    salarioController.dispose();
    percentualController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reajuste salarial')),
      body: Padding(
        padding: EdgeInsets.all(20),
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
              controller: salarioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Salário atual',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: percentualController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Percentual de reajuste',
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
