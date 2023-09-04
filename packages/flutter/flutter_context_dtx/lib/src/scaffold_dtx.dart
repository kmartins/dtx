import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [ScaffoldState] using [BuildContext]
///
extension ScaffoldDtx on BuildContext {
  ScaffoldState get scaffoldState => Scaffold.of(this);

  ScaffoldMessengerState get scaffoldMessengerState =>
      ScaffoldMessenger.of(this);

  double? get appBarMaxHeight => scaffoldState.appBarMaxHeight;

  bool get hasAppBar => scaffoldState.hasAppBar;

  bool get hasDrawer => scaffoldState.hasDrawer;

  bool get hasEndDrawer => scaffoldState.hasEndDrawer;

  bool get hasFloatingActionButton => scaffoldState.hasFloatingActionButton;

  bool get isDrawerOpen => scaffoldState.isDrawerOpen;

  bool get isEndDrawerOpen => scaffoldState.isEndDrawerOpen;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    SnackBar snackBar, {
    bool hideCurrent = true,
  }) {
    if (hideCurrent) {
      hideCurrentSnackBar();
    }
    return scaffoldMessengerState.showSnackBar(snackBar);
  }

  void removeCurrentSnackBar({
    SnackBarClosedReason reason = SnackBarClosedReason.remove,
  }) =>
      scaffoldMessengerState.removeCurrentSnackBar(reason: reason);

  void hideCurrentSnackBar({
    SnackBarClosedReason reason = SnackBarClosedReason.hide,
  }) =>
      scaffoldMessengerState.hideCurrentSnackBar(reason: reason);

  void openDrawer() => scaffoldState.openDrawer();

  void openEndDrawer() => scaffoldState.openEndDrawer();

  void showBottomSheet(
    WidgetBuilder builder, {
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
  }) =>
      scaffoldState.showBottomSheet(
        builder,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        clipBehavior: clipBehavior,
      );
}
