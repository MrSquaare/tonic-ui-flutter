library tonic_ui;

import 'package:flutter/widgets.dart';

import '../styles/colors.dart';

class Radio extends StatelessWidget {
  const Radio({
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
          color: value ? Colors.white : Colors.lightGrey,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: value
            ? Center(
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.primary,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
