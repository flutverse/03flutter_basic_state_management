import 'package:flutter/material.dart';
import 'theme_inherited_widget.dart';

/// [InheritedScreen] হলো রুট র্যাপার যা স্টেট পরিবর্তন করতে পারে এবং ট্রিতে পাস করে।
class InheritedScreen extends StatefulWidget {
  const InheritedScreen({super.key});

  @override
  State<InheritedScreen> createState() => _InheritedScreenState();
}

class _InheritedScreenState extends State<InheritedScreen> {
  bool _isDark = false;

  void _toggleTheme() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeConfig = AppThemeConfig(
      primaryColor: _isDark ? Colors.purpleAccent : Colors.indigo,
      appTitle: 'ইনহেরিটেড স্টেট আর্কিটেকচার',
      isDarkMode: _isDark,
    );

    // উইজেট ট্রির উপরে ThemeInheritedWidget দিয়ে র‍্যাপ করা হচ্ছে
    return ThemeInheritedWidget(
      config: themeConfig,
      onToggleTheme: _toggleTheme,
      child: const _DeepChildScaffold(),
    );
  }
}

/// এটি উইজেট ট্রির গভীরে থাকা একটি উইজেট
class _DeepChildScaffold extends StatelessWidget {
  const _DeepChildScaffold();

  @override
  Widget build(BuildContext context) {
    // সরাসরি .of(context) দিয়ে প্যারেন্টের ইনহেরিটেড ডেটা অ্যাক্সেস করা হচ্ছে!
    final inherited = ThemeInheritedWidget.of(context);

    return Scaffold(
      backgroundColor: inherited.config.isDarkMode
          ? Colors.grey.shade900
          : Colors.white,
      appBar: AppBar(
        title: Text(inherited.config.appTitle),
        backgroundColor: inherited.config.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              inherited.config.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              size: 72,
              color: inherited.config.primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              inherited.config.isDarkMode
                  ? 'ডার্ক মোড সক্রিয়'
                  : 'লাইট মোড সক্রিয়',
              style: TextStyle(
                fontSize: 20,
                color: inherited.config.isDarkMode
                    ? Colors.white
                    : Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: inherited.onToggleTheme,
              icon: const Icon(Icons.color_lens),
              label: const Text('থিম পরিবর্তন করুন'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(160, 48),
                backgroundColor: inherited.config.primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
