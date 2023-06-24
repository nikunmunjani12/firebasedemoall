import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context, listen: false);
    final selc = Provider.of<SelectedProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(
              builder: (context, counterProvider, child) =>
                  Text('${counterProvider.counter}'),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                provider.increment(context);
              },
            ),
            ElevatedButton(onPressed: () {}, child: const Text('')),
            Consumer<SelectedProvider>(
              builder: (context, value, child) => Column(
                children: List.generate(
                  2,
                  (index) => InkResponse(
                    onTap: () {
                      selc.selected1(index);
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      color: value.selected == index ? Colors.blue : Colors.red,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
