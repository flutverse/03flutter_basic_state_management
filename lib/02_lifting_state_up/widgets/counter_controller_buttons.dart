import 'package:flutter/material.dart';

/// [CounterControllerButtons] আরেকটি চাইল্ড উইজেট।
/// এটি স্কোর সম্পর্কে কিছু জানে না, শুধু প্যারেন্ট থেকে পাওয়া ফাংশনগুলোকে কল করে।
class CounterControllerButtons extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;
  const CounterControllerButtons({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Column(
          children: [
            const Text(
              'চাইল্ড ২ (কন্ট্রোলার বাটনস - Callbacks Up)',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // পয়েন্ট কমানোর বাটন
                OutlinedButton.icon(
                  onPressed: onDecrement,
                  icon: const Icon(Icons.remove_circle, color: Colors.white),
                  label: const Text(
                    '১০ কমান',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(120, 48),
                    backgroundColor: Colors.red, // Accessiblity tap target
                  ),
                ),
                // পয়েন্ট বাড়ানোর বাটন
                ElevatedButton.icon(
                  onPressed: onReset,
                  icon: const Icon(Icons.lock_reset_outlined),
                  label: const Text(' 0 করুণ'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 48),
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: onIncrement,
                  icon: const Icon(Icons.add_circle, color: Colors.white),
                  label: const Text(
                    '১০ বাড়ান',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(120, 48),
                    backgroundColor: Colors.green, // Accessiblity tap target
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
