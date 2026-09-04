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
      home: EstoqueSimples(),
    );
  }
}

class EstoqueSimples extends StatefulWidget {
  const new({super.key});

  @override
  State<EstoqueSimples> createState() => _EstoqueSimplesState();
}

class _EstoqueSimplesState extends State<EstoqueSimples> {
  int estoque = 0;

  void aumentarEstoque() {
    setState(() {
      estoque++;
    });
  }

  void diminuirEstoque() {
    setState(() {
      estoque--;

      if (estoque < 0) {
        zerarEstoque();
      }
    });
  }

  void zerarEstoque() {
    setState(() {
      estoque = 0;
    });
  }

  void confirmarZerarEstoque() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Zerar estoque'),
          content: Text('Tem certeza que deseja zerar o estoque?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                zerarEstoque();
                Navigator.of(context).pop();
              },
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento de estoque simples'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Text(
              'Estoque atual: $estoque',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: aumentarEstoque,
                  child: Text('Entrada'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: diminuirEstoque,
                  child: Text('Saída'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: confirmarZerarEstoque,
              child: Text('Zerar Estoque'),
            ),
          ],
        ),
      ),
    );
  }
}
