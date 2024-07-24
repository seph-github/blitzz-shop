import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool useMinimumWidth;
  final double? minWidth;
  final bool isNummbers;
  final String? Function(String?)? validator;

  const CustomTextfield({
    super.key,
    this.hintText,
    this.controller,
    this.useMinimumWidth = false,
    this.isNummbers = false,
    this.minWidth,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double width = size.width / 2 - 48;

    final double? newMinWidth = useMinimumWidth ? 100 : minWidth;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hintText ?? ''),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: newMinWidth ?? width,
          child: TextFormField(
            controller: controller,
            validator: validator,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintText: hintText,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            keyboardType: isNummbers ? TextInputType.number : null,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
