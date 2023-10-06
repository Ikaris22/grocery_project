import 'package:flutter/material.dart';
import 'package:vippro_project/widgets/textbutton_openall.dart';
import 'package:vippro_project/widgets/title.dart';

class TopListviewLabel extends StatelessWidget{
  final String title;
  final String textButtonName;
  final Function() clickTextButton;

  const TopListviewLabel({super.key, required this.title, required this.textButtonName, required this.clickTextButton});
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [TitleName(title: title), TextButtonOpenAll(textButtonName: textButtonName, onClick: clickTextButton)],
    );
  }
  
}