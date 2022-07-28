import 'package:flutter/material.dart';

///
/// Contains extensions for easier access the other
/// properties using [BuildContext]
///
extension BuildContextDtx on BuildContext {
  PageStorageBucket? get pageStorage => PageStorage.of(this);

  ScrollBehavior get scrollBehavior => ScrollConfiguration.of(this);

  ScrollableState? get scrollable => Scrollable.of(this);

  ActionDispatcher get actions => Actions.of(this);

  AnimatedListState get animatedList => AnimatedList.of(this);

  AssetBundle get defaultAssetBundle => DefaultAssetBundle.of(this);

  SliverAnimatedListState get sliverAnimatedList => SliverAnimatedList.of(this);

  bool get tickingEnabled => TickerMode.of(this);
}
