// import 'package:casino_slots/flame/extensions/extensions.dart';
import 'package:flame/components.dart';
import 'package:flame_learn/spine_boy/spine_boy_game.dart';
import 'package:flame_spine/flame_spine.dart';

enum SpineBoyAnim {
  idle('idle'),
  hit('hit'),
  jump('jump'),
  run('run'),
  shoot('shoot'),
  walk('walk'),
  death('death');

  final String name;
  const SpineBoyAnim(this.name);
}

class SpineBoy extends PositionComponent with HasGameRef<SpineBoyGame> {
  SpineBoy();

  late final SpineComponent spine;

  @override
  Future<void> onLoad() async {
    spine = await SpineComponent.fromAssets(
      atlasFile: 'assets/spine/spineboy/spineboy.atlas',
      skeletonFile: 'assets/spine/spineboy/spineboy.json',
      scale: Vector2(0.4, 0.4),
      anchor: Anchor.center,
      position: gameRef.size / 2 - size / 2,
    );

    spine.animationState.setAnimationByName(0, SpineBoyAnim.idle.name, true);

    add(spine);
  }

  @override
  void onRemove() {
    spine.dispose();
    super.onRemove();
  }
}
