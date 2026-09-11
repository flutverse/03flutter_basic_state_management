import 'package:flutter/material.dart';

import '01_ephemeral_state/ephemeral_counter_screen.dart';
import '02_lifting_state_up/lifting_state_screen.dart';
import '03_value_notifier/value_notifier_screen.dart';
import '04_change_notifier/change_notifier_screen.dart';
import '05_inherited_widget/inherited_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic State Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final examples = <_StateExampleData>[
      _StateExampleData(
        title: '01. Ephemeral State',
        description: 'Local widget state with setState()',
        screen: const EphemeralCounterScreen(),
      ),
      _StateExampleData(
        title: '02. Lifting State Up',
        description: 'Keep state in the parent and pass it to children',
        screen: const LiftingStateScreen(),
      ),
      _StateExampleData(
        title: '03. ValueNotifier',
        description: 'Reactive state with value listening',
        screen: const ValueNotifierScreen(),
      ),
      _StateExampleData(
        title: '04. ChangeNotifier',
        description: 'Model-driven state with ChangeNotifier',
        screen: const ChangeNotifierScreen(),
      ),
      _StateExampleData(
        title: '05. InheritedWidget',
        description: 'Dependency injection via inherited theme state',
        screen: const InheritedScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter State Management')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: examples.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final example = examples[index];

          return Card(
            child: ListTile(
              title: Text(example.title),
              subtitle: Text(example.description),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute<void>(builder: (_) => example.screen));
              },
            ),
          );
        },
      ),
    );
  }
}

class _StateExampleData {
  const _StateExampleData({
    required this.title,
    required this.description,
    required this.screen,
  });

  final String title;
  final String description;
  final Widget screen;
}
