import 'package:flutter/material.dart';
import 'scene_item.dart';

class Mood {
  final String name;
  final String label;
  final Color color;
  final IconData icon;
  final String text;
  final String message;
  final List<SceneItem> sceneItems;

  const Mood({
    required this.name,
    required this.label,
    required this.color,
    required this.icon,
    required this.text,
    required this.message,
    required this.sceneItems,
  });
}