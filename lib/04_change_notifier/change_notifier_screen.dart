import 'package:flutter/material.dart';

import 'counter_controller.dart';

class ChangeNotifierScreen extends StatefulWidget {
  const ChangeNotifierScreen({super.key});

  @override
  State<ChangeNotifierScreen> createState() => _ChangeNotifierScreenState();
}

class _ChangeNotifierScreenState extends State<ChangeNotifierScreen> {
  final CounterController _controller = CounterController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('04. ChangeNotifier')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListenableBuilder(
            listenable: _controller,
            builder: (context, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Business logic separated from UI',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  Semantics(
                    label: 'Current counter value is ${_controller.count}',
                    liveRegion: true,
                    child: Text(
                      '${_controller.count}',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      FilledButton.icon(
                        onPressed: _controller.increment,
                        icon: const Icon(Icons.add),
                        label: const Text('Increment'),
                      ),
                      FilledButton.tonalIcon(
                        onPressed: _controller.decrement,
                        icon: const Icon(Icons.remove),
                        label: const Text('Decrement'),
                      ),
                      OutlinedButton.icon(
                        onPressed: _controller.reset,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Reset'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
