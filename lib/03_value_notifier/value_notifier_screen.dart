import 'package:flutter/material.dart';

class ValueNotifierScreen extends StatefulWidget {
  const ValueNotifierScreen({super.key});

  @override
  State<ValueNotifierScreen> createState() => _ValueNotifierScreenState();
}

class _ValueNotifierScreenState extends State<ValueNotifierScreen> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('03. ValueNotifier')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Reactive state built with ValueNotifier',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              ValueListenableBuilder<int>(
                valueListenable: _counter,
                builder: (context, value, _) {
                  return Semantics(
                    label: 'Current counter value is $value',
                    liveRegion: true,
                    child: Text(
                      '$value',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 28),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  FilledButton.icon(
                    onPressed: () => _counter.value++,
                    icon: const Icon(Icons.add),
                    label: const Text('Increment'),
                  ),
                  FilledButton.tonalIcon(
                    onPressed: () => _counter.value--,
                    icon: const Icon(Icons.remove),
                    label: const Text('Decrement'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _counter.value = 0,
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
