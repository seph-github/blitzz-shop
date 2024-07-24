import 'package:flutter/material.dart';

class AddressDropdown extends StatelessWidget {
  final String? hintText;
  final Widget child;
  final double? minWidth;

  const AddressDropdown({
    this.hintText,
    required this.child,
    this.minWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double width = size.width / 2 - 48;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hintText ?? ''),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: minWidth ?? width,
          child: child,
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
