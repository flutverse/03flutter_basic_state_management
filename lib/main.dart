import 'package:flutter/material.dart';
import '01_ephemeral_state/ephemeral_counter_screen.dart';
import '02_lifting_state_up/lifting_state_screen.dart';
import '03_value_notifier/value_notifier_screen.dart';
import '04_change_notifier/change_notifier_screen.dart';
import '05_inherited_widget/inherited_screen.dart';

void main() {
  runApp(const StateManagementLectureApp());
}

class StateManagementLectureApp extends StatelessWidget {
  const StateManagementLectureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic State Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 2),
      ),
      home: const LectureCatalogScreen(),
    );
  }
}

/// [LectureCatalogScreen] সকল স্টেট ম্যানেজমেন্ট উদাহরণের তালিকা প্রদর্শন করে
class LectureCatalogScreen extends StatelessWidget {
  const LectureCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lectureModules = [
      _ModuleItem(
        title: '01. Ephemeral State (setState)',
        subtitle: 'StatefulWidget-এর অভ্যন্তরীণ লোকাল স্টেট ম্যানেজমেন্ট',
        icon: Icons.looks_one_rounded,
        screen: const EphemeralCounterScreen(),
      ),
      _ModuleItem(
        title: '02. Lifting State Up',
        subtitle: 'কমন প্যারেন্ট উইজেটে স্টেট রাখা এবং কলব্যাক পাঠানো',
        icon: Icons.looks_two_rounded,
        screen: const LiftingStateScreen(),
      ),
      _ModuleItem(
        title: '03. ValueNotifier & Builder',
        subtitle: 'অপ্রয়োজনীয় rebuild ছাড়া সূক্ষ্ম ও দ্রুত রিঅ্যাক্টিভ আপডেট',
        icon: Icons.looks_3_rounded,
        screen: const ValueNotifierScreen(),
      ),
      _ModuleItem(
        title: '04. ChangeNotifier Architecture',
        subtitle: 'UI থেকে বিজনেস লজিককে আলাদা রাখার সবচেয়ে জনপ্রিয় পদ্ধতি',
        icon: Icons.looks_4_rounded,
        screen: const ChangeNotifierScreen(),
      ),
      _ModuleItem(
        title: '05. InheritedWidget Core',
        subtitle: 'Provider এবং Theme.of(context) এর ভেতরের মূল মেকানিজম',
        icon: Icons.looks_5_rounded,
        screen: const InheritedScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter State Management লেকচার')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: lectureModules.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = lectureModules[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                item.icon,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            title: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(item.subtitle),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item.screen),
              );
            },
          );
        },
      ),
    );
  }
}

class _ModuleItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget screen;

  _ModuleItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.screen,
  });
}
