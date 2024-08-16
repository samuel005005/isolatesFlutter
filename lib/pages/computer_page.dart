import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ComputerPage extends StatefulWidget {
  const ComputerPage({super.key});

  @override
  State<ComputerPage> createState() => _ComputerPageState();
}

class _ComputerPageState extends State<ComputerPage> {
  bool isLoading = false;
  int number = 0;

  void onPressed() async {
    setState(() {
      isLoading = true;
    });
    final result = await compute<int, int>(fibonacci, 45);
    number = result;
    setState(() {
      isLoading = false;
    });
  }

  static int fibonacci(int n) {
    if (n < 2) {
      return n;
    }
    return fibonacci(n - 2) + fibonacci(n - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Funcion de Fibonacci"),
      ),
      body: Center(
        child: isLoading ? const CircularProgressIndicator() : Text("$number"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: const Text("Calcular"),
      ),
    );
  }
}
