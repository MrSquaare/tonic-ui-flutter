library tonic_ui;

import 'package:flutter/widgets.dart';

import '../styles/colors.dart';

class Card extends StatelessWidget {
  const Card({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _getDecoration(),
      padding: _getPadding(),
      child: child,
    );
  }

  Color _getBorderColor() {
    return Colors.black;
  }

  Border _getBorder() {
    return Border(
      top: BorderSide(
        color: _getBorderColor(),
        width: 2,
      ),
      left: BorderSide(
        color: _getBorderColor(),
        width: 2,
      ),
      right: BorderSide(
        color: _getBorderColor(),
        width: 2,
      ),
      bottom: BorderSide(
        color: _getBorderColor(),
        width: 4,
      ),
    );
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: _getBorder(),
      borderRadius: BorderRadius.circular(12),
    );
  }

  EdgeInsets _getPadding() {
    return const EdgeInsets.all(16);
  }
}
