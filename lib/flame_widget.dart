import 'package:flame/game.dart';
import 'package:flame_learn/spine_boy/spine_boy_game.dart';
import 'package:flutter/widgets.dart';

class FlameWidget extends StatefulWidget {
  const FlameWidget({super.key});

  @override
  State<FlameWidget> createState() => _FlameWidgetState();
}

class _FlameWidgetState extends State<FlameWidget> {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: SpineBoyGame(),
    );
  }
}
