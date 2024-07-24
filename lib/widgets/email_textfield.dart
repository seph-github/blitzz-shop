import 'package:blitzz_shop/utils/app_string.dart';
import 'package:flutter/material.dart';

class EmailTextfield extends StatelessWidget {
  const EmailTextfield({
    super.key,
    required this.controller,
    this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double width = size.width / 2 - 48;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            emailLabel,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.amber, width: 2),
              ),
            ),
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
