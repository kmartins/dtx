import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [ModalRoute] using [BuildContext]
///
extension ModalRouteDtx on BuildContext {
  ModalRoute? get modalRoute => ModalRoute.of(this);

  RouteSettings? get routeSettings => modalRoute?.settings;
}
