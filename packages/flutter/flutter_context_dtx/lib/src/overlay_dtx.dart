import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [Overlay] and [OverlayState] using [BuildContext]
///
extension OverlayDtx on BuildContext {
  OverlayState get overlay => Overlay.of(this);

  OverlayEntry addOverlay(WidgetBuilder builder) {
    final entry = OverlayEntry(builder: builder);
    overlay.insert(entry);
    return entry;
  }
}
