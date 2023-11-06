import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_fonts.dart';

class ExpansionQuestion extends StatelessWidget {
  final String title;
  final String content;
  const ExpansionQuestion(
      {super.key, required this.title, required this.content});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 0,
          child: ExpansionTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            collapsedBackgroundColor: AppColors.profileColor,
            backgroundColor: AppColors.whiteColor,
            title: Text(
              title,
              style: const TextStyle(
                fontFamily: AppFonts.monserratRegular,
                fontSize: 16,
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  content,
                  style: const TextStyle(
                    fontFamily: AppFonts.monserratRegular,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
