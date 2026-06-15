import 'package:flutter/material.dart';
import '../models/mood.dart';
import '../widgets/mood_button.dart';
import '../widgets/mood_card.dart';
import '../widgets/mood_message.dart';
import '../widgets/mood_scene.dart';

class MoodHomePage extends StatefulWidget {
  const MoodHomePage({super.key});

  @override
  State<MoodHomePage> createState() => _MoodHomePageState();
}

class _MoodHomePageState extends State<MoodHomePage> {
  Mood? _selectedMood;
  bool _showMessage = false;
  bool _showScene = false;

  void _selectMood(Mood mood) {
    setState(() {
      _selectedMood = mood;
      _showMessage = false;
      _showScene = false;
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) setState(() => _showMessage = true);
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) setState(() => _showScene = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Mood App',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4527A0),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Como você está se sentindo hoje?',
                style: TextStyle(fontSize: 15, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              MoodCard(selectedMood: _selectedMood),

              const SizedBox(height: 20),

              MoodMessage(
                selectedMood: _selectedMood,
                visible: _showMessage,
              ),

              const SizedBox(height: 20),

              MoodScene(
                selectedMood: _selectedMood,
                visible: _showScene,
              ),

              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Escolha seu humor:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.1,
                children: moods.map((mood) {
                  return MoodButton(
                    mood: mood,
                    isSelected: _selectedMood?.name == mood.name,
                    onTap: () => _selectMood(mood),
                  );
                }).toList(),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}