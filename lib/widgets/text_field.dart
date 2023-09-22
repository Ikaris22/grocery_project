import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_colors.dart';
class InputField extends StatelessWidget{
  final String textfieldName;
  final String textfieldHintText;
const InputField({super.key, required this.textfieldName,required this.textfieldHintText });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text(textfieldName,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,),)],
        ),
        const SizedBox(height: 12),
        TextField(
           decoration: InputDecoration(
             hintStyle: const TextStyle(fontSize: 16,color: AppColors.miniTextColor),
             hintText: textfieldHintText,
             border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10)
             ),
             contentPadding: const EdgeInsets.all(12)
           ),
        )],
    );
  }
}