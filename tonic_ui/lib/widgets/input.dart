library tonic_ui;

import 'package:flutter/widgets.dart';

import '../styles/colors.dart';

class Input extends StatefulWidget {
  const Input({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input>
    implements TextSelectionGestureDetectorBuilderDelegate {
  @override
  final GlobalKey<EditableTextState> editableTextKey =
      GlobalKey<EditableTextState>();

  @override
  bool get forcePressEnabled => false;

  @override
  bool get selectionEnabled => true;

  late final TextSelectionGestureDetectorBuilder _sgdBuilder;
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _sgdBuilder = TextSelectionGestureDetectorBuilder(delegate: this);
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return _sgdBuilder.buildGestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: _getDecoration(),
        padding: _getPadding(),
        child: EditableText(
          key: editableTextKey,
          controller: _controller,
          focusNode: _focusNode,
          rendererIgnoresPointer: true,
          mouseCursor: MouseCursor.defer,
          enableInteractiveSelection: selectionEnabled,
          cursorColor: Colors.black,
          backgroundCursorColor: Colors.black,
          selectionColor: _getSelectionColor(),
          style: _getTextStyle(),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    return Colors.white;
  }

  Color _getBorderColor() {
    return Colors.black;
  }

  Border _getBorder() {
    return Border.all(
      color: _getBorderColor(),
      width: 2,
    );
  }

  BorderRadius _getBorderRadius() {
    return BorderRadius.circular(12);
  }

  Decoration _getDecoration() {
    return BoxDecoration(
      color: _getBackgroundColor(),
      border: _getBorder(),
      borderRadius: _getBorderRadius(),
    );
  }

  EdgeInsets _getPadding() {
    return const EdgeInsets.all(16);
  }

  Color _getSelectionColor() {
    return Colors.primary.withOpacity(0.5);
  }

  TextStyle _getTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }
}
