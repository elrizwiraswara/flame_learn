import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_learn/spine_boy/control_button.dart';
import 'package:flame_learn/spine_boy/spine_boy.dart';
import 'package:flame_spine/flame_spine.dart';

import 'fire_button.dart';

class SpineBoyGame extends FlameGame with TapCallbacks {
  late SpineBoy _spineBoy;

  SpineBoyGame() {
    pauseWhenBackgrounded = false;
  }

  @override
  Future<void> onLoad() async {
    await initSpineFlutter();

    // load spine
    _spineBoy = SpineBoy();

    addAll([_spineBoy]);

    // create game HUD (Heads-Up Display) widget
    createHudWidget();

    super.onLoad();
  }

  @override
  void onRemove() {
    processLifecycleEvents();
    Flame.images.clearCache();
    Flame.assets.clearCache();
    super.onRemove();
  }

  void createHudWidget() {
    final fpsInfo = FpsTextComponent(
      position: Vector2(20, 20),
    );

    final score = TextComponent(
      text: 'TEXT POSITION LEFT',
      position: Vector2(20, 80),
    );

    final level = TextComponent(
      text: 'TEXT POSITION RELATIVE RIGHT',
    );
    // Set position relative to the right side of the screen
    level.position = Vector2(size.x - level.size.x - 20, 80);

    final fireButton = FireButton();
    final controlButton = ControlButton();

    addAll([
      fpsInfo,
      score,
      level,
      fireButton,
      controlButton,
    ]);
  }
}
