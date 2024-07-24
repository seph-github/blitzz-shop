import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? width;

  const PrimaryButton({
    super.key,
    this.width,
    required this.label,
    this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double buttonMinWidth = size.width / 2 - 48;
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width ?? buttonMinWidth,
      height: 50,
      elevation: 1,
      color: Colors.amber,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(label),
    );
  }
}
