import 'package:flutter/widgets.dart';
import 'package:tonic_ui/tonic_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../utilities/show_action_dialog.dart';

@widgetbook.UseCase(name: 'Toggle', type: Toggle)
Widget buildToggleUseCase(BuildContext context) {
  return Toggle(
    value: context.knobs.boolean(
      label: 'Value',
      initialValue: false,
    ),
    onChanged: (value) {
      showActionDialog(
        context: context,
        title: 'Toggle changed',
        content: 'The toggle was changed to $value',
      );
    },
  );
}
