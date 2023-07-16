import 'package:event_handling/controller/test_controller.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final controller = TestController();

  TestPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                controller.getData();
               // Navigator.pushNamed(context, '/');
              },
              child: const Text('GET Data', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
