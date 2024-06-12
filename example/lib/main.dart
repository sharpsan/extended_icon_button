import 'package:flutter/material.dart';
import 'package:icon_button_extended/icon_button_extended.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  int _counter = 0;
  final Duration _debounce = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// icon buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButtonExtended(
                  longHoldDebounce: _debounce,
                  color: Colors.red.shade300,
                  iconSize: 52,
                  icon: const Icon(Icons.remove_circle),
                  onPressed: _decrement,
                  onLongHold: _decrement,
                  onLongPress: _decrement,
                ),
                IconButtonExtended(
                  longHoldDebounce: _debounce,
                  color: Colors.green.shade300,
                  iconSize: 52,
                  icon: const Icon(Icons.add_circle),
                  onPressed: _increment,
                  onLongHold: _increment,
                  onLongPress: _increment,
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// counter
            Text(
              'Counter: $_counter',
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }
}
