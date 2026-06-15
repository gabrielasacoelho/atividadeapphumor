import 'package:flutter/material.dart';
import '../models/mood.dart';

class MoodMessage extends StatelessWidget {
  final Mood? selectedMood;
  final bool visible;

  const MoodMessage({
    super.key,
    required this.selectedMood,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 600),
      child: selectedMood != null
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: selectedMood!.color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: selectedMood!.color.withOpacity(0.4),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Você escolheu o humor ${selectedMood!.label}.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: selectedMood!.color.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    selectedMood!.message,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : const SizedBox(height: 60),
    );
  }
}