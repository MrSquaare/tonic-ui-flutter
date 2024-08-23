library tonic_ui;

import 'package:flutter/widgets.dart';
import '../extensions/color.dart';
import '../styles/colors.dart';

enum ButtonType {
  filled,
  outlined,
  transparent,
}

enum ButtonSize {
  small,
  medium,
  large,
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.label,
    this.type = ButtonType.filled,
    this.size = ButtonSize.medium,
    this.withShadow = true,
    this.onPressed,
    this.onLongPress,
  });

  final String label;
  final ButtonType type;
  final ButtonSize size;
  final bool withShadow;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<Button> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onLongPress: widget.onLongPress,
      onTapDown: (details) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: _getDecoration(),
        padding: _getPadding(),
        margin: _getMargin(),
        child: Text(
          widget.label,
          style: _getLabelStyle(),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (widget.type == ButtonType.filled) {
      if (_isPressed) {
        return Colors.primary.darken(0.075);
      }

      return Colors.primary;
    }

    if (widget.type == ButtonType.outlined) {
      return Colors.transparent;
    }

    return Colors.transparent;
  }

  Color _getBorderColor() {
    if (widget.type == ButtonType.transparent) {
      return Colors.transparent;
    }

    return Colors.black;
  }

  Border? _getBorder() {
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
        width: widget.withShadow && !_isPressed ? 4 : 2,
      ),
    );
  }

  BorderRadius _getBorderRadius() {
    if (widget.size == ButtonSize.large) {
      return BorderRadius.circular(16);
    }

    if (widget.size == ButtonSize.small) {
      return BorderRadius.circular(8);
    }

    return BorderRadius.circular(12);
  }

  _getDecoration() {
    return BoxDecoration(
      color: _getBackgroundColor(),
      border: _getBorder(),
      borderRadius: _getBorderRadius(),
    );
  }

  Color _getForegroundColor() {
    if (widget.type == ButtonType.filled) {
      return Colors.black;
    }

    if (widget.type == ButtonType.outlined) {
      return Colors.black;
    }

    return Colors.black;
  }

  double _getLabelFontSize() {
    if (widget.size == ButtonSize.large) {
      return 20;
    }

    if (widget.size == ButtonSize.small) {
      return 12;
    }

    return 16;
  }

  TextStyle _getLabelStyle() {
    return TextStyle(
      color: _getForegroundColor(),
      fontSize: _getLabelFontSize(),
      fontWeight: FontWeight.w900,
    );
  }

  EdgeInsets _getPadding() {
    if (widget.size == ButtonSize.large) {
      return const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      );
    }

    if (widget.size == ButtonSize.small) {
      return const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      );
    }

    return const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    );
  }

  EdgeInsets _getMargin() {
    if (widget.withShadow && _isPressed) {
      return const EdgeInsets.only(top: 2);
    }

    return EdgeInsets.zero;
  }
}
