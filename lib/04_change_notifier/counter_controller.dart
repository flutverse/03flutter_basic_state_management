import 'package:flutter/foundation.dart';

/// [CounterController] হলো একটি বিশুদ্ধ ডার্ট ক্লাস যা [ChangeNotifier] মিক্সিন/এক্সটেন্ড করে।
/// এর ভেতরে কোনো UI কোড (যেমন: Widget, BuildContext, Scaffold) থাকবে না।
class CounterController extends ChangeNotifier {
  // প্রাইভেট স্টেট
  int _count = 0;
  bool _isLoading = false;

  // গেটার্স (Getters) যার মাধ্যমে বাইরে থেকে UI শুধু পড়তে পারে (Encapsulation)
  int get count => _count;
  bool get isLoading => _isLoading;

  /// বিজনেস লজিক ১: সাধারণ মান বাড়ানো
  void increment() {
    _count++;
    // notifyListeners() কল করলে যত উইজেট বা লিসেনার এই কন্ট্রোলার শুনছে সবাই আপডেট সিগন্যাল পাবে
    notifyListeners();
  }

  /// বিজনেস লজিক ২: সাধারণ মান কমানো
  void decrement() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }

  /// বিজনেস লজিক ৩: কোনো অ্যাসিনক্রোনাস কাজ (যেমন: API ফেচ বা বিলম্ব)
  Future<void> simulateNetworkFetch() async {
    _isLoading = true;
    notifyListeners(); // UI-কে লোডার দেখানোর জন্য জানানো

    // ২ সেকেন্ড ফেক নেটওয়ার্ক লেটেন্সি
    await Future.delayed(const Duration(seconds: 2));

    _count += 50; // নেটওয়ার্ক থেকে আসা নতুন ডেটা
    _isLoading = false;
    notifyListeners(); // লোডার বন্ধ ও নতুন ডেটা দেখানোর জন্য নোটিফাই
  }
}
