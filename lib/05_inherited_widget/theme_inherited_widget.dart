import 'package:flutter/material.dart';

/// [AppThemeConfig] হলো ডেটা ক্লাস যা আমরা উইজেট ট্রিতে শেয়ার করতে চাই।
class AppThemeConfig {
  final Color primaryColor;
  final String appTitle;
  final bool isDarkMode;

  const AppThemeConfig({
    required this.primaryColor,
    required this.appTitle,
    required this.isDarkMode,
  });
}

/// [ThemeInheritedWidget] উইজেট ট্রির যেকোনো গভীরতার চাইল্ডকে কনস্ট্রাক্টর প্রপ-ড্রিলিং ছাড়াই
/// সরাসরি ডেটা অ্যাক্সেস এবং পরিবর্তন নোটিফাই করার ক্ষমতা দেয়।
class ThemeInheritedWidget extends InheritedWidget {
  final AppThemeConfig config;
  final VoidCallback onToggleTheme;

  const ThemeInheritedWidget({
    super.key,
    required this.config,
    required this.onToggleTheme,
    required super.child,
  });

  /// সুবিধাজনক কনভেনশন মেথড: .of(context)
  /// `dependOnInheritedWidgetOfExactType` চাইল্ডকে রেজিস্টার করে,
  /// যেন updateShouldNotify সত্য হলে সেই চাইল্ড স্বয়ংক্রিয়ভাবে rebuild হয়।
  static ThemeInheritedWidget of(BuildContext context) {
    final ThemeInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
    assert(result != null, 'No ThemeInheritedWidget found in context');
    return result!;
  }

  /// ফ্রেমওয়ার্ককে নির্ধারণ করতে সাহায্য করে চাইল্ড উইজেটগুলোর রি-বিল্ড হওয়া প্রয়োজন কিনা।
  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
    // যদি কনফিগ পরিবর্তন হয়ে থাকে, কেবল তখনই রি-বিল্ড হবে
    return config.isDarkMode != oldWidget.config.isDarkMode ||
        config.primaryColor != oldWidget.config.primaryColor;
  }
}
