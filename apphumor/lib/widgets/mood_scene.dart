import 'package:flutter/material.dart';
import '../models/mood.dart';
import '../models/scene_item.dart';

class MoodScene extends StatelessWidget {
  final Mood? selectedMood;
  final bool visible;

  const MoodScene({
    super.key,
    required this.selectedMood,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 700),
      child: selectedMood != null
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: selectedMood!.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    'Modo Cena — ${selectedMood!.label}',
                    style: TextStyle(
                      fontSize: 13,
                      color: selectedMood!.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: selectedMood!.sceneItems
                        .map((item) => _AnimatedSceneIcon(item: item))
                        .toList(),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

class _AnimatedSceneIcon extends StatefulWidget {
  final SceneItem item;

  const _AnimatedSceneIcon({required this.item});

  @override
  State<_AnimatedSceneIcon> createState() => _AnimatedSceneIconState();
}

class _AnimatedSceneIconState extends State<_AnimatedSceneIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Icon(
            widget.item.icon,
            size: widget.item.size,
            color: widget.item.color,
          ),
        );
      },
    );
  }
}