import 'package:flutter/material.dart';

class AppThemeInheritedWidget extends InheritedWidget {
  const AppThemeInheritedWidget({
    required this.themeMode,
    required this.onThemeChanged,
    required super.child,
    super.key,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChanged;

  static AppThemeInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppThemeInheritedWidget>();
  }

  @override
  bool updateShouldNotify(AppThemeInheritedWidget oldWidget) {
    return oldWidget.themeMode != themeMode;
  }
}
