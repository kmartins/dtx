import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [Navigator] and [NavigatorState] using [BuildContext]
///
extension NavigatorDtx on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  Future<T?> push<T extends Object?>(Route<T> route) => navigator.push(route);

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> route, {
    TO? result,
  }) =>
      navigator.pushReplacement(route, result: result);

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      navigator.pushNamed(routeName, arguments: arguments);

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      navigator.pushReplacementNamed(
        routeName,
        result: result,
        arguments: arguments,
      );

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      navigator.popAndPushNamed(
        routeName,
        result: result,
        arguments: arguments,
      );

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) =>
      navigator.pushNamedAndRemoveUntil(
        newRouteName,
        predicate,
        arguments: arguments,
      );

  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) =>
      navigator.pushAndRemoveUntil(newRoute, predicate);

  void replace<T extends Object?>({
    required Route<dynamic> oldRoute,
    required Route<T> newRoute,
  }) =>
      navigator.replace(oldRoute: oldRoute, newRoute: newRoute);

  void replaceRouteBelow<T extends Object?>({
    required Route<dynamic> anchorRoute,
    required Route<T> newRoute,
  }) =>
      navigator.replaceRouteBelow(anchorRoute: anchorRoute, newRoute: newRoute);

  bool canPop() => navigator.canPop();

  Future<bool> maybePop<T extends Object?>([T? result]) =>
      navigator.maybePop(result);

  void popUntil(RoutePredicate predicate) => navigator.popUntil(predicate);

  void pop<T extends Object?>([T? result]) => navigator.pop(result);

  void removeRoute(Route<dynamic> route) => navigator.removeRoute(route);

  void removeRouteBelow(Route<dynamic> anchorRoute) =>
      navigator.removeRouteBelow(anchorRoute);

  void finalizeRoute(Route<dynamic> route) => navigator.finalizeRoute(route);
}
