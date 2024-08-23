import 'package:flutter/widgets.dart';
import 'package:tonic_ui/tonic_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../utilities/show_action_dialog.dart';

@widgetbook.UseCase(name: 'Radio', type: Radio)
Widget buildToggleUseCase(BuildContext context) {
  return Radio(
    value: context.knobs.boolean(
      label: 'Value',
      initialValue: false,
    ),
    onChanged: (value) {
      showActionDialog(
        context: context,
        title: 'Checkbox changed',
        content: 'The checkbox was changed to $value',
      );
    },
  );
}
