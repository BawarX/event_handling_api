import 'package:event_handling/services/user_model.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: ListView.builder(

        itemCount: 3,
        itemBuilder: (context, index) { 
          return  const ListTile(
          );
        },
      ),
    );
  }
}