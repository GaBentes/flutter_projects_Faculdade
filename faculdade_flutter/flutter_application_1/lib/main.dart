import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //retira a faixa de debug
      home: Scaffold(
        appBar: AppBar(title: Text('Minha primeira aula de Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flutter_dash, size: 80),
              SizedBox(height: 20,),
              Text('Aprendendo Flutter', 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text('Construindo interfaces com widgets'),
            ],
          ),
        ),
      ),
    );
  }
}
