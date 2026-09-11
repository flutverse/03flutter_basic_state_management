import 'package:flutter/material.dart';

/// [CounterDisplay] একটি Stateless চাইল্ড উইজেট।
/// এটি নিজে কোনো স্টেট পরিবর্তন করতে পারে না; প্যারেন্ট থেকে প্রপস হিসেবে পায়।
class CounterDisplay extends StatelessWidget {
  final int currentScore;

  const CounterDisplay({super.key, required this.currentScore});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'চাইল্ড ১ (ডিসপ্লে উইজেট)',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            Semantics(
              liveRegion: true,
              label: 'স্কোর: $currentScore পয়েন্ট',
              child: Text(
                '$currentScore',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const Text('পয়েন্ট সংগৃহীত'),
          ],
        ),
      ),
    );
  }
}
