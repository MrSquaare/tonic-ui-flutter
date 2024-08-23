library tonic_ui;

import 'package:flutter/widgets.dart';

extension ColorBrightness on Color {
  Color darken(double amount) {
    assert(amount >= 0 && amount <= 1);

    final base = HSLColor.fromColor(this);
    final lightness = base.lightness - amount;
    final computed = base.withLightness((lightness).clamp(0.0, 1.0));

    return computed.toColor();
  }

  Color lighten(double amount) {
    assert(amount >= 0 && amount <= 1);

    final base = HSLColor.fromColor(this);
    final lightness = base.lightness + amount;
    final computed = base.withLightness((lightness).clamp(0.0, 1.0));

    return computed.toColor();
  }
}
