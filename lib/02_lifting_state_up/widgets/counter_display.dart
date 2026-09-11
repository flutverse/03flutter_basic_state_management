import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.value, super.key});

  final int value;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$value',
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
    );
  }
}
