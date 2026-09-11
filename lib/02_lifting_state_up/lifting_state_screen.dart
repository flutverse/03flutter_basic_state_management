import 'package:flutter/material.dart';

import 'widgets/counter_controller_buttons.dart';
import 'widgets/counter_display.dart';

class LiftingStateScreen extends StatefulWidget {
  const LiftingStateScreen({super.key});

  @override
  State<LiftingStateScreen> createState() => _LiftingStateScreenState();
}

class _LiftingStateScreenState extends State<LiftingStateScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('02. Lifting State Up')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'State is kept in the parent and shared with children',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              CounterDisplay(value: _counter),
              const SizedBox(height: 28),
              CounterControllerButtons(
                onIncrement: _incrementCounter,
                onDecrement: _decrementCounter,
                onReset: _resetCounter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
