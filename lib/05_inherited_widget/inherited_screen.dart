import 'package:flutter/material.dart';

import 'theme_inherited_widget.dart';

class InheritedScreen extends StatefulWidget {
  const InheritedScreen({super.key});

  @override
  State<InheritedScreen> createState() => _InheritedScreenState();
}

class _InheritedScreenState extends State<InheritedScreen> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(ThemeMode nextTheme) {
    setState(() {
      _themeMode = nextTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeInheritedWidget(
      themeMode: _themeMode,
      onThemeChanged: _toggleTheme,
      child: Builder(
        builder: (context) {
          final inheritedTheme = AppThemeInheritedWidget.of(context)!;
          final themeIsDark = inheritedTheme.themeMode == ThemeMode.dark;

          return Scaffold(
            backgroundColor: themeIsDark ? Colors.black87 : Colors.white,
            appBar: AppBar(title: const Text('05. InheritedWidget')),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      themeIsDark
                          ? 'Dark mode is active'
                          : 'Light mode is active',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: themeIsDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: () {
                        inheritedTheme.onThemeChanged(
                          themeIsDark ? ThemeMode.light : ThemeMode.dark,
                        );
                      },
                      icon: Icon(
                        themeIsDark ? Icons.light_mode : Icons.dark_mode,
                      ),
                      label: Text(
                        themeIsDark ? 'Switch to light' : 'Switch to dark',
                      ),
                    ),
                    const SizedBox(height: 24),
                    SwitchListTile(
                      value: themeIsDark,
                      title: Text(
                        'Enable dark theme',
                        style: TextStyle(
                          color: themeIsDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      onChanged: (enabled) {
                        inheritedTheme.onThemeChanged(
                          enabled ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
