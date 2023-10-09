import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_colors.dart';

class InputField extends StatelessWidget {
  final String textFieldName;
  final String textFieldHintText;

  const InputField({
    super.key,
    required this.textFieldName,
    required this.textFieldHintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              textFieldName,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        TextField(
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontSize: 16,
              color: AppColors.miniTextColor,
            ),
            hintText: textFieldHintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        )
      ],
    );
  }
}
