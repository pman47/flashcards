import 'package:flashcards/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'flashcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Flashcard> _flashcards = [
    Flashcard(
      question: "What programming language does flutter use?",
      answer: "Dart",
    ),
    Flashcard(
      question: "Who is coder of this app?",
      answer: "M A N I S H",
    ),
    Flashcard(
      question: "From where you learn to create applications?",
      answer: "YouTube",
    ),
    Flashcard(
      question: "Which social media application you like the most?",
      answer: "Instagram",
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 250,
                child: FlipCard(
                  front:
                      FlashcardView(text: _flashcards[_currentIndex].question),
                  back: FlashcardView(text: _flashcards[_currentIndex].answer),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPreviousCard,
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                      elevation: 4,
                    ),
                    icon: const Icon(CupertinoIcons.arrow_left_square),
                    label: const Text('prev'),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                      elevation: 4,
                    ),
                    label: const Icon(CupertinoIcons.arrow_right_square),
                    icon: const Text('next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
