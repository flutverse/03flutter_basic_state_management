import 'package:flutter/material.dart';

/// [ValueNotifierScreen] প্রদর্শন করে কীভাবে ক্ষুদ্রাতিক্ষুদ্র (Fine-grained) রি-বিল্ড করা যায়।
/// StatefulWidget ছাড়া সাধারণ StatelessWidget-এর ভেতরেও ValueNotifier ব্যবহার করে UI রিয়্যাক্টিভ করা যায়!
class ValueNotifierScreen extends StatefulWidget {
  const ValueNotifierScreen({super.key});

  @override
  State<ValueNotifierScreen> createState() => _ValueNotifierScreenState();
}

class _ValueNotifierScreenState extends State<ValueNotifierScreen> {
  // ১. একটি ValueNotifier ইনিশিয়ালাইজ করা (প্রাথমিক মান: ০)
  final ValueNotifier<int> _itemCountNotifier = ValueNotifier<int>(0);

  // ২. স্টেট পরিবর্তনকারী মেথড
  void _addItem() {
    _itemCountNotifier.value++; // .value আপডেট হওয়ামাত্রই লিসেনাররা নোটিফাই হয়
  }

  void _removeItem() {
    if (_itemCountNotifier.value > 0) {
      _itemCountNotifier.value--;
    }
  }

  // মেমোরি লিক রোধে অবশ্যই dispose মেথডে নোটিফায়ার ডিসপোজ করতে হবে
  @override
  void dispose() {
    _itemCountNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // খেয়াল করুন: এই প্রিন্ট স্টেটমেন্টটি বাটন প্রেস করলে বারবার কল হবে না!
    debugPrint('==> ValueNotifierScreen Top-Level Build Called!');

    return Scaffold(
      appBar: AppBar(title: const Text('03. ValueNotifier & Builder')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'এই পুরো স্ক্রিন Rebuild হয় না; শুধুমাত্র নিচে থাকা ValueListenableBuilder রি-বিল্ড হয়!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // ৩. ValueListenableBuilder উইজেট
            // এটি শুধুমাত্র তখন এবং ঠিক সেখানে রি-বিল্ড হয় যখন _itemCountNotifier এর মান বদলায়
            ValueListenableBuilder<int>(
              valueListenable: _itemCountNotifier,
              builder: (BuildContext context, int count, Widget? child) {
                debugPrint(
                  '==> Only ValueListenableBuilder Rebuilt! Value: $count',
                );
                return Column(
                  children: [
                    Semantics(
                      liveRegion: true,
                      label: 'কার্ট আইটেম সংখ্যা: $count টি',
                      child: Icon(
                        Icons.shopping_cart,
                        size: 64,
                        color: count > 0 ? Colors.green : Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'কার্টে আইটেম আছে: $count টি',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: count > 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 32),

            // কন্ট্রোল বাটনসমূহ
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.outlined(
                  onPressed: _removeItem,
                  icon: const Icon(Icons.remove, color: Colors.red),
                  style: IconButton.styleFrom(backgroundColor: Colors.red[100]),
                  tooltip: 'একটি আইটেম বাদ দিন',
                ),
                const SizedBox(width: 24),
                IconButton.outlined(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.green[100],
                  ),
                  onPressed: _addItem,
                  icon: const Icon(Icons.add, color: Colors.green),
                  tooltip: 'একটি আইটেম যোগ করুন',
                ),
              ],
            ),

            const SizedBox(height: 40),

            // সুবিধাসমূহ
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.shade300),
              ),
              child: const Text(
                '⚡ সুবিধা: ValueNotifier অত্যন্ত হালকা (Lightweight) এবং উচ্চ পারফরম্যান্স দেয়, '
                'কারণ এটি অ্যাপের পুরো উইজেট ট্রির বড় অংশকে অপ্রয়োজনীয় rebuild হওয়া থেকে বাঁচায়।',
                style: TextStyle(color: Colors.teal, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
