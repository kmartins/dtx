import 'package:flutter/material.dart';

/// Defines a set of standardized window size breakpoints for width, based on
/// Material Design 3 guidelines for adaptive layouts.
enum WindowWidthSizeClass implements Comparable<WindowWidthSizeClass> {
  /// Width is below 600dp.
  /// Represents 99.96% of phones in portrait mode.
  compact,

  /// Width is between 600dp and 839dp (inclusive).
  /// Represents 93.73% of tablets in portrait mode.
  medium,

  /// Width is between 840dp and 1199dp (inclusive).
  /// Represents 97.22% of tablets in landscape mode.
  expanded,

  /// Width is between 1200dp and 1599dp (inclusive).
  /// Typically used for large tablet displays.
  large,

  /// Width is 1600dp or larger.
  /// Typically used for desktop displays.
  extraLarge;

  @override
  int compareTo(WindowWidthSizeClass other) => index.compareTo(other.index);
}

/// Defines a set of standardized window size breakpoints for height, based on
/// Material Design 3 guidelines for adaptive layouts.
enum WindowHeightSizeClass implements Comparable<WindowHeightSizeClass> {
  /// Height is below 480dp.
  /// Represents 99.78% of phones in landscape mode.
  compact,

  /// Height is between 480dp and 899dp (inclusive).
  /// Represents 96.56% of tablets in landscape and 97.59% of phones in portrait.
  medium,

  /// Height is 900dp or larger.
  /// Represents 94.25% of tablets in portrait mode.
  expanded;

  @override
  int compareTo(WindowHeightSizeClass other) => index.compareTo(other.index);
}

/// Represents the window size classes for a given window size,
/// providing both a width and a height size class.
final class WindowSizeClass {
  const WindowSizeClass._({
    required this.widthSizeClass,
    required this.heightSizeClass,
  });

  final WindowWidthSizeClass widthSizeClass;

  final WindowHeightSizeClass heightSizeClass;

  /// Creates a [WindowSizeClass] instance from a given [Size].
  factory WindowSizeClass.calculateFromSize(Size size) {
    // Determine the width size class
    final WindowWidthSizeClass width = switch (size.width) {
      < 600 => WindowWidthSizeClass.compact,
      >= 600 && < 840 => WindowWidthSizeClass.medium,
      >= 840 && < 1200 => WindowWidthSizeClass.expanded,
      >= 1200 && < 1600 => WindowWidthSizeClass.large,
      _ => WindowWidthSizeClass.extraLarge,
    };

    // Determine the height size class
    final WindowHeightSizeClass height = switch (size.height) {
      < 480 => WindowHeightSizeClass.compact,
      >= 480 && < 900 => WindowHeightSizeClass.medium,
      _ => WindowHeightSizeClass.expanded,
    };

    return WindowSizeClass._(widthSizeClass: width, heightSizeClass: height);
  }
}

extension WindowWidthComparison on WindowWidthSizeClass {
  bool operator >(WindowWidthSizeClass other) => compareTo(other) > 0;
  bool operator <(WindowWidthSizeClass other) => compareTo(other) < 0;
  bool operator >=(WindowWidthSizeClass other) => compareTo(other) >= 0;
  bool operator <=(WindowWidthSizeClass other) => compareTo(other) <= 0;
}

extension WindowHeightComparison on WindowHeightSizeClass {
  bool operator >(WindowHeightSizeClass other) => compareTo(other) > 0;
  bool operator <(WindowHeightSizeClass other) => compareTo(other) < 0;
  bool operator >=(WindowHeightSizeClass other) => compareTo(other) >= 0;
  bool operator <=(WindowHeightSizeClass other) => compareTo(other) <= 0;
}
