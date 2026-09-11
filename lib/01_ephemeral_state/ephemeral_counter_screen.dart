import 'package:flutter/material.dart';

class EphemeralCounterScreen extends StatefulWidget {
  const EphemeralCounterScreen({super.key});

  @override
  State<EphemeralCounterScreen> createState() => _EphemeralCounterScreenState();
}

class _EphemeralCounterScreenState extends State<EphemeralCounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
      appBar: AppBar(title: const Text('01. Ephemeral State')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Local state with setState()',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Semantics(
                label: 'Current counter value is $_counter',
                liveRegion: true,
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: _incrementCounter,
                    icon: const Icon(Icons.add),
                    label: const Text('Increment'),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton.icon(
                    onPressed: _resetCounter,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
