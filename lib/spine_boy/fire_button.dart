import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_learn/spine_boy/spine_boy.dart';
import 'package:flame_learn/spine_boy/spine_boy_game.dart';
import 'package:flutter/material.dart';

class FireButton extends CircleComponent with HasGameRef<SpineBoyGame>, TapCallbacks {
  // priority index seems like z-index
  // which determines that component’s sorting order within its parent’s children
  // The higher the priority is set to, it will be rendered on top of any components with lower priority
  FireButton() : super(priority: 1);

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Because [FireButton] is extended as [CircleComponent]
    // we can directly set the parameters of [CircleComponent] here
    radius = 100;
    scale = Vector2(1, 1);
    paint = Paint()..color = Colors.white12;

    // Set position relative to the right side of the screen
    // Get screen size from [SpineBoyGame] gameRef with mixin of [HasGameRef<SpineBoyGame>]
    position = Vector2(
      gameRef.size.x - size.x - 100,
      gameRef.size.y - size.y - 80,
    );

    // Create child [CircleComponent] then add to this [FireButton] component
    final childCircle = CircleComponent(
      radius: 100,
      position: Vector2(width / 4, height / 4),
      scale: Vector2(0.5, 0.5), // half of [fireButton] scale
      paint: Paint()..color = Colors.white12,
    );

    add(childCircle);
  }

  // one of override methods from [TapCallbacks] mixin
  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    print('tembak!');

    // retrieve [SpineBoy] component in this [FireButton] component:
    final spineBoy = gameRef.findByKey<SpineBoy>(
      ComponentKey.named('spineBoy'),
    );

    // Trigger [SpineBoy] to run [shoot] animation
    spineBoy?.shoot();
  }
}
