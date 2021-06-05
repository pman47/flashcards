import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  final String text;
  const FlashcardView({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.teal,
      elevation: 5,
      child: Center(
        child: Text(
          text,
          style:const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
