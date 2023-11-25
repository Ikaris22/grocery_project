import 'dart:ui';

import 'package:flutter/material.dart';
class ImagePage extends StatelessWidget {
  final String image;
  final bool isSelected;
  final Function() clickNavigator;
  const ImagePage({super.key, required this.image,required this.isSelected,required this.clickNavigator });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          InkWell(
            onTap: clickNavigator,
            child: Image.asset(
              image,
            ),
          ),
          if (!isSelected)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 0),
              child: Container(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
        ],
      ),
    );
  }
}