import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [TabController],
/// [MaterialInkController] and [ScrollController] using [BuildContext]
///
extension ControllerDtx on BuildContext {
  TabController? get tabController => DefaultTabController.of(this);

  MaterialInkController? get materialInkController => Material.of(this);

  ScrollController? get primaryScrollController =>
      PrimaryScrollController.of(this);
}
