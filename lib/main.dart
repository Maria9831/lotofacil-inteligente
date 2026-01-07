import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const LotofacilApp());
}

class LotofacilApp extends StatelessWidget {
  const LotofacilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotofácil Inteligente',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<int>> jogos = [];

  void gerarJogos() {
    final random = Random();
    jogos = List.generate(3, (_) {
      final numeros = <int>{};
      while (numeros.length < 15) {
        numeros.add(random.nextInt(25) + 1);
      }
      return numeros.toList()..sort();
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lotofácil Inteligente'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: gerarJogos,
              child: const Text(
                'GERAR 3 JOGOS INTELIGENTES',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: jogos.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Jogo ${index + 1}: ${jogos[index].join(' - ')}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
