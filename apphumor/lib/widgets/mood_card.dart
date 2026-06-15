import 'package:flutter/material.dart';
import '../models/mood.dart';

class MoodCard extends StatelessWidget {
  final Mood? selectedMood;

  const MoodCard({super.key, required this.selectedMood});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = selectedMood?.color ?? const Color(0xFF7E57C2);
    final double containerSize = selectedMood != null ? 220 : 160;
    final double borderRadius = selectedMood != null ? 60 : 20;

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: bgColor.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selectedMood?.icon ?? Icons.sentiment_neutral,
              size: 64,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                selectedMood?.text ?? 'Escolha um humor!',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}