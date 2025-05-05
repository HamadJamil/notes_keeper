import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:notes_keeper/data/database_constants/table_notes.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key, required this.note});
  final Map<String, dynamic> note;

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  final AnimatedTextController myAnimatedTextController =
      AnimatedTextController();

  @override
  void dispose() {
    super.dispose();
    myAnimatedTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.note[columnTitle],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    widget.note[columnDescription],
                    textStyle: const TextStyle(fontSize: 17),
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                isRepeatingAnimation: false,
                pause: const Duration(milliseconds: 300),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                controller: myAnimatedTextController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
