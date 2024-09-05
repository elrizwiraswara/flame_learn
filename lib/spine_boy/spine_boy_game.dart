import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_learn/spine_boy/spine_boy.dart';
import 'package:flame_spine/flame_spine.dart';

class SpineBoyGame extends FlameGame with KeyboardEvents {
  late Vector2 screenSize;

  late SpineBoy _spineBoy;

  SpineBoyGame() {
    pauseWhenBackgrounded = false;
  }

  @override
  Future<void> onLoad() async {
    await initSpineFlutter();

    // get size of the screen
    screenSize = size;

    // load spine
    _spineBoy = SpineBoy();
    add(_spineBoy);

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
      scale: Vector2(0.8, 0.8),
    );

    final score = TextComponent(
      text: '123456',
      position: Vector2(20, 80),
    );

    final level = TextComponent(
      text: 'Level 1',
      position: Vector2(
        screenSize.x - 20, // 20px from right
        80,
      ),
    );

    // final customWidget = PositionComponent(
    //   children: [
    //     Component()
    //   ],
    //   position: Vector2(
    //     screenSize.x - 20, // 20px from right
    //     80,
    //   ),
    // );

    // final flutterWidget = FlutterWidgetComponent(
    //   widget: customWidget,
    //   position: Vector2(50, 100), // Position it on the game screen
    //   size: Vector2(100, 50), // Match the size of the container
    // );

    addAll([
      fpsInfo,
      score,
      level,
    ]);
  }
}
