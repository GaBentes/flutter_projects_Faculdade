import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculadoraMedia(),
    );
  }
}

class CalculadoraMedia extends StatefulWidget {
  const new({super.key});

  @override
  State<CalculadoraMedia> createState() => _CalculadoraMediaState();
}

class _CalculadoraMediaState extends State<CalculadoraMedia> {
  final TextEditingController textoController = TextEditingController();
  String mensagem = '';
  String textoAtual = '';
  double calc = 0.0;

  void calculaTexto() {
    try {

      String textoFinal = textoController.text;
      textoFinal = textoFinal.replaceAll('×', '*');
      textoFinal = textoFinal.replaceAll('÷', '/');

      Parser p = Parser();
      Expression exp = p.parse(textoFinal);
      ContextModel cm = ContextModel();
      double resultado = exp.evaluate(EvaluationType.REAL, cm);

      if (resultado % 1 == 0) {
        textoController.text = resultado.toInt().toString();
      } else {
        textoController.text = resultado.toStringAsFixed(2); // 2 casas decimais
      }

      textoController.selection = TextSelection.fromPosition(
        TextPosition(offset: textoController.text.length),
      );

      mensagem = 'ok';

    }
    catch (e){
      mensagem = 'erro';

    }
  }

  void voltaUm() {
    setState(() {
      textoAtual = textoController.text;

      if (textoAtual.isNotEmpty) {
        textoController.text = textoAtual.substring(0, textoAtual.length - 1);

        textoController.selection = TextSelection.fromPosition(
          TextPosition(offset: textoController.text.length),
        );
      }
    });
  }

  void limparDados() {
    setState(() {
      textoController.clear();
    });
  }

  @override
  void dispose() {
    textoController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.multiline,
              controller: textoController,
              minLines: 5,
              maxLines: 10,
              maxLength: 500,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: limparDados,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(75, 50),
                  ),
                  child: Text('AC'),
                ),
                SizedBox(height: 10, width: 10),
                ElevatedButton(
                  onPressed: () => setState(() => textoController.text += '('),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(75, 50),
                  ),
                  child: Text('('),
                ),
                SizedBox(height: 10, width: 10),
                ElevatedButton(
                  onPressed: () => setState(() => textoController.text += ')'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(75, 50),
                  ),
                  child: Text(')'),
                ),
                SizedBox(height: 10, width: 10),
                ElevatedButton(
                  onPressed: () => setState(() => textoController.text += '÷'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(75, 50),
                  ),
                  child: Text('÷'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '7'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('7'),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '8'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('8'),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '9'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('9'),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '×'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('×'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '4'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('4'),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '5'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('5'),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '6'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('6'),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '-'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('-'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '1'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('1'),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '2'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('2'),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '3'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('3'),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '+'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('+'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '0'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('0'),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: () =>
                          setState(() => textoController.text += '.'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('.'),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: voltaUm,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Icon(Icons.backspace_outlined),
                    ),
                    SizedBox(height: 10, width: 10),
                    ElevatedButton(
                      onPressed: calculaTexto,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(75, 50),
                      ),
                      child: Text('='),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
