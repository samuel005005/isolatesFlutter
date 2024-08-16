import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FibonacciParams {
  final int n;
  final String message;

  FibonacciParams({
    required this.n,
    required this.message,
  });
  FibonacciParams copyWith({int? n, String? message}) {
    return FibonacciParams(
      n: n ?? this.n,
      message: message ?? this.message,
    );
  }
}

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
    final result = await compute<FibonacciParams, int>(
      fibonacci,
      FibonacciParams(n: 45, message: "Hola"),
    );
    number = result;
    setState(() {
      isLoading = false;
    });
  }

  static int fibonacci(FibonacciParams params) {
    final n = params.n;
    if (n < 2) {
      return n;
    }
    return fibonacci(params.copyWith(n: n - 2)) +
        fibonacci(params.copyWith(n: n - 1));
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
