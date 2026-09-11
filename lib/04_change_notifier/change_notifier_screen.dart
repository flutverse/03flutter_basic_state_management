import 'package:flutter/material.dart';
import 'counter_controller.dart';

/// [ChangeNotifierScreen] উইজেটটি UI রেন্ডার করে এবং [ListenableBuilder] এর মাধ্যমে কন্ট্রোলারের সাথে যুক্ত হয়।
class ChangeNotifierScreen extends StatefulWidget {
  const ChangeNotifierScreen({super.key});

  @override
  State<ChangeNotifierScreen> createState() => _ChangeNotifierScreenState();
}

class _ChangeNotifierScreenState extends State<ChangeNotifierScreen> {
  // কন্ট্রোলারের ইন্সট্যান্স তৈরি
  late final CounterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CounterController();
  }

  @override
  void dispose() {
    // কন্ট্রোলার ডিসপোজ নিশ্চিত করা যাতে কোনো মেমরি লিক না হয়
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('04. ChangeNotifier Architecture')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ChangeNotifier (State) + ListenableBuilder (UI)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 24),

              // ListenableBuilder Flutter-এর আধুনিক স্ট্যান্ডার্ড (AnimatedBuilder-এর পরিপূরক)
              ListenableBuilder(
                listenable: _controller,
                builder: (context, child) {
                  if (_controller.isLoading) {
                    return const Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 12),
                        Text('নেটওয়ার্ক থেকে ডেটা লোড হচ্ছে...'),
                      ],
                    );
                  }

                  return Semantics(
                    liveRegion: true,
                    label: 'কন্ট্রোলারের মান: ${_controller.count}',
                    child: Text(
                      '${_controller.count}',
                      style: const TextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.w900,
                        color: Colors.orange,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 32),

              // কন্ট্রোল বাটন
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _controller.decrement,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 48),
                    ),
                    child: const Text('- কমান'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _controller.increment,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 48),
                    ),
                    child: const Text('+ বাড়ান'),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // অ্যাসিনক্রোনাস অ্যাকশন বাটন
              FilledButton.icon(
                onPressed: _controller.isLoading
                    ? null
                    : _controller.simulateNetworkFetch,
                icon: const Icon(Icons.cloud_download),
                label: const Text('অনলাইন ডেটা আনুন (+৫০)'),
                style: FilledButton.styleFrom(minimumSize: const Size(220, 48)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
