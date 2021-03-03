import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [ModalRoute] and
/// [RouteSettings] using [BuildContext]
///
extension ModalRouteDtx on BuildContext {
  ModalRoute? get modalRoute => ModalRoute.of(this);

  RouteSettings? get routeSettings => modalRoute?.settings;

  T args<T>() => modalRoute?.settings.arguments as T;
}
