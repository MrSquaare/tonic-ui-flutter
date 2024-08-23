import 'package:flutter/widgets.dart';
import 'package:tonic_ui/tonic_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Button', type: Button)
Widget buildButtonUseCase(BuildContext context) {
  return Button(
    label: context.knobs.string(
      label: 'Label',
      initialValue: 'Button',
    ),
    type: context.knobs.list(
      label: 'Type',
      initialOption: ButtonType.filled,
      options: ButtonType.values,
    ),
    size: context.knobs.list(
      label: 'Size',
      initialOption: ButtonSize.medium,
      options: ButtonSize.values,
    ),
    withShadow: context.knobs.boolean(
      label: 'With shadow',
      initialValue: true,
    ),
  );
}
