import 'package:flutter/material.dart';
import 'widgets/counter_display.dart';
import 'widgets/counter_controller_buttons.dart';

/// [LiftingStateScreen] হলো কমন প্যারেন্ট উইজেট।
/// কেন Lifting State Up দরকার?
/// যখন দুটি আলাদা সহোদর (Sibling) উইজেটের একই স্টেট দরকার পড়ে,
/// তখন স্টেটকে তাদের নিকটতম কমন প্যারেন্টে (Common Ancestor) নিয়ে আসতে হয়।
class LiftingStateScreen extends StatefulWidget {
  const LiftingStateScreen({super.key});

  @override
  State<LiftingStateScreen> createState() => _LiftingStateScreenState();
}

class _LiftingStateScreenState extends State<LiftingStateScreen> {
  // কমন প্যারেন্টে স্টেট সংরক্ষিত রাখা হচ্ছে
  int _sharedScore = 0;

  // ১. স্কোর বাড়ানোর ফাংশন (যা চাইল্ড উইজেটে কলব্যাক হিসেবে পাস করা হবে)
  void _increaseScore() {
    setState(() {
      _sharedScore += 10;
    });
  }

  // ২.
  void _resetScore() {
    setState(() {
      _sharedScore = 0;
    });
  }

  // ৩. স্কোর কমানোর ফাংশন
  void _decreaseScore() {
    setState(() {
      _sharedScore -= 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('02. Lifting State Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'প্যারেন্ট উইজেট স্টেট ধরে রাখে এবং চাইল্ডদের কাছে পাস করে',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // চাইল্ড উইজেট ১: শুধুমাত্র ডেটা রিড করে এবং ডিসপ্লে করে (Data Down)
            CounterDisplay(currentScore: _sharedScore),

            const SizedBox(height: 24),

            // চাইল্ড উইজেট ২: বাটন ট্যাপ করলে প্যারেন্টের মেথড ট্রিগার করে (Callback Up)
            CounterControllerButtons(
              onIncrement: _increaseScore,
              onDecrement: _decreaseScore,
              onReset: _resetScore,
            ),

            const Spacer(),

            // লেকচার নোট
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Text(
                '📌 নিয়ম: "Data Flows Down, Events/Callbacks Bubble Up"\n'
                'সীমাবদ্ধতা: উইজেট ট্রি অনেক গভীর হলে এই পদ্ধতিতে "Prop Drilling" সমস্যা তৈরি হয়।',
                style: TextStyle(color: Colors.indigo, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
