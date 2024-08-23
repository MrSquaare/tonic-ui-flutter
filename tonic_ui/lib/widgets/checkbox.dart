library tonic_ui;

import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../styles/colors.dart';

class Checkbox extends StatelessWidget {
  const Checkbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: value ? Colors.primary : Colors.lightGrey,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: value
            ? const Center(
                child: PhosphorIcon(
                  PhosphorIconsBold.check,
                  color: Colors.black,
                  size: 20,
                ),
              )
            : null,
      ),
    );
  }
}
