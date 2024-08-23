import 'package:flutter/widgets.dart';
import 'package:tonic_ui/tonic_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Card', type: Card)
Widget buildCardUseCase(BuildContext context) {
  return const Card(
    child: Text('Card child'),
  );
}
