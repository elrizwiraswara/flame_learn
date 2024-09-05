import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_learn/spine_boy/spine_boy.dart';
import 'package:flame_learn/spine_boy/spine_boy_game.dart';
import 'package:flutter/material.dart';

class ControlButton extends PositionComponent with HasGameRef<SpineBoyGame> {
  // priority index seems like z-index
  ControlButton() : super(priority: 1);

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    anchor = Anchor.center;

    position = Vector2(
      100,
      gameRef.size.y - 200,
    );

    final forwardButton = ForwardButton(onTapForward);
    forwardButton.position = Vector2(155, 0);

    final backwardButton = BackwardButton(onTapBackward);

    final jumpButton = JumpButton(onTapJump);
    jumpButton.position = Vector2(60, -70);

    addAll([
      forwardButton,
      backwardButton,
      jumpButton,
    ]);
  }

  void onTapForward() {
    print('majuu!');

    // retrieve [SpineBoy] component in this [ControlButton] component:
    final spineBoy = gameRef.findByKey<SpineBoy>(
      ComponentKey.named('spineBoy'),
    );

    // Trigger [SpineBoy] to run [run] animation
    spineBoy?.run();
  }

  void onTapBackward() {
    print('mundurr!');

    // retrieve [SpineBoy] component in this [ControlButton] component:
    final spineBoy = gameRef.findByKey<SpineBoy>(
      ComponentKey.named('spineBoy'),
    );

    // Trigger [SpineBoy] to run [run] animation with flipped spine
    spineBoy?.runBackward();
  }

  void onTapJump() {
    print('lompaat!!');

    // retrieve [SpineBoy] component in this [ControlButton] component:
    final spineBoy = gameRef.findByKey<SpineBoy>(
      ComponentKey.named('spineBoy'),
    );

    // Trigger [SpineBoy] to run [jump] animation
    spineBoy?.jump();
  }
}

class ForwardButton extends PositionComponent with TapCallbacks {
  final Function() onTap;

  ForwardButton(this.onTap);

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Create a path for the triangle
    final path = Path()
      // ..moveTo(0, 0)
      ..lineTo(50, 40)
      ..lineTo(0, 80)
      ..close();

    final paint = Paint()..color = Colors.white30;

    // Draw the triangle
    canvas.drawPath(path, paint);
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    // define the width and height of this component
    // to tell [onTapDown] the area that can be tap
    width = 50;
    height = 80;
  }

  // one of override methods from [TapCallbacks] mixin
  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    // Pass [onTap] param to this [onTapDown] function
    onTap();
  }
}

class BackwardButton extends CustomPainterComponent with TapCallbacks {
  final Function() onTap;

  BackwardButton(this.onTap);

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Create a path for the triangle
    final path = Path()
      ..moveTo(50, 0)
      ..lineTo(50, 80)
      ..lineTo(0, 40)
      ..close();

    final paint = Paint()..color = Colors.white30;

    // Draw the triangle
    canvas.drawPath(path, paint);
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    // define the width and height of this component
    // to tell [onTapDown] the area that can be tap
    width = 50;
    height = 80;
  }

  // one of override methods from [TapCallbacks] mixin
  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    // Pass [onTap] param to this [onTapDown] function
    onTap();
  }
}

class JumpButton extends CustomPainterComponent with TapCallbacks {
  final Function() onTap;

  JumpButton(this.onTap);

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Create a path for the triangle
    final path = Path()
      ..moveTo(40, 0)
      ..lineTo(80, 50)
      ..lineTo(0, 50)
      ..close();

    final paint = Paint()..color = Colors.white30;

    // Draw the triangle
    canvas.drawPath(path, paint);
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    // define the width and height of this component
    // to tell [onTapDown] the area that can be tap
    width = 50;
    height = 80;
  }

  // one of override methods from [TapCallbacks] mixin
  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    // Pass [onTap] param to this [onTapDown] function
    onTap();
  }
}
