import 'package:flutter/material.dart';
import '../models/mood.dart';

class MoodButton extends StatelessWidget {
  final Mood mood;
  final bool isSelected;
  final VoidCallback onTap;

  const MoodButton({
    super.key,
    required this.mood,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isSelected ? mood.color : mood.color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(isSelected ? 20 : 12),
          border: Border.all(
            color: mood.color,
            width: isSelected ? 3 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: mood.color.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              mood.icon,
              size: 30,
              color: isSelected ? Colors.white : mood.color,
            ),
            const SizedBox(height: 4),
            Text(
              mood.label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : mood.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}