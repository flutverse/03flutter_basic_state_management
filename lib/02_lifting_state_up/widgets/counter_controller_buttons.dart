import 'package:flutter/material.dart';

class CounterControllerButtons extends StatelessWidget {
  const CounterControllerButtons({
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
    super.key,
  });

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 12,
      children: [
        FilledButton.icon(
          onPressed: onIncrement,
          icon: const Icon(Icons.add),
          label: const Text('Increment'),
        ),
        FilledButton.tonalIcon(
          onPressed: onDecrement,
          icon: const Icon(Icons.remove),
          label: const Text('Decrement'),
        ),
        OutlinedButton.icon(
          onPressed: onReset,
          icon: const Icon(Icons.refresh),
          label: const Text('Reset'),
        ),
      ],
    );
  }
}
