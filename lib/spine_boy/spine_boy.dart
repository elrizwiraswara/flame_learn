import 'package:flame/components.dart';
import 'package:flame_learn/spine_boy/spine_boy_game.dart';
import 'package:flame_spine/flame_spine.dart';

// List of Spine animation name that available in the current spineboy assets
// U can see it in [spineboyd.json] under [animations] list
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
  SpineBoy()
      : super(
          // Components can have an identification key that allows them to be retrieved from the component tree,
          // from any point of the tree.
          key: ComponentKey.named('spineBoy'),
        );

  late final SpineComponent spine;

  @override
  Future<void> onLoad() async {
    spine = await SpineComponent.fromAssets(
      atlasFile: 'assets/spine/spineboy/spineboy.atlas',
      skeletonFile: 'assets/spine/spineboy/spineboy.json',
      scale: Vector2(0.4, 0.4),
      anchor: Anchor.center, // Anchor determines the point [position] value start points
      position: gameRef.size / 2 - size / 2, // [gameRef.size] is game screen size, [size] is [SpineBoy] size
    );

    // init spine animation
    initAnimation();

    add(spine);
  }

  @override
  void onRemove() {
    spine.dispose();
    super.onRemove();
  }

  void initAnimation() {
    idle();

    spine.animationState.setListener(
      (type, entry, event) {
        print('type.index = ${type.index}');
        print('type.name = ${type.name}');
        print('entry.getAnimation().getName() = ${entry.getAnimation().getName()}');
        print('entry.getAnimation().getDuration() = ${entry.getAnimation().getDuration()}');
        print('entry.getLoop() = ${entry.getLoop()}');
        print('event?.getData() = ${event?.getData()}');

        final currAnim = entry.getAnimation().getName();
        final currState = type.name;

        if (currAnim == 'jump' && currState == 'complete') {
          idle();
        }

        if (currAnim == 'run' && currState == 'complete') {
          idle();
        }
      },
    );
  }

  void idle() {
    // [trackIndex] is likely animation index, which is if we add other [animationState]
    // with same [trackIndex] value, it will replaced the current animation with other animation
    // So, if u want 2 or more animation run simultanously, use different [trackIndex] value
    spine.animationState.setAnimationByName(
      0, // trackIndex
      SpineBoyAnim.idle.name, // animation name
      true, // enable/disable loop
    );
  }

  void run() async {
    // Fli spine
    if (spine.isFlippedHorizontally) {
      spine.flipHorizontally();
    }

    spine.animationState.setAnimationByName(
      0, // trackIndex
      SpineBoyAnim.run.name, // animation name
      false, // enable/disable loop
    );
  }

  void runBackward() async {
    // Fli spine
    if (!spine.isFlippedHorizontally) {
      spine.flipHorizontally();
    }

    spine.animationState.setAnimationByName(
      0, // trackIndex
      SpineBoyAnim.run.name, // animation name
      false, // enable/disable loop
    );
  }

  void shoot() {
    spine.animationState.setAnimationByName(
      1, // trackIndex
      SpineBoyAnim.shoot.name, // animation name
      false, // enable/disable loop
    );
  }

  void hit() {
    spine.animationState.setAnimationByName(
      0, // trackIndex
      SpineBoyAnim.hit.name, // animation name
      false, // enable/disable loop
    );
  }

  void jump() {
    spine.animationState.setAnimationByName(
      0, // trackIndex
      SpineBoyAnim.jump.name, // animation name
      false, // enable/disable loop
    );
  }
}
