import 'package:flutter/material.dart';

class SuggestedView extends StatelessWidget {
  const SuggestedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Suggested Tab",
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
