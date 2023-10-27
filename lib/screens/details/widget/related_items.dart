import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../base/app_colors.dart';
import '../../../base/app_images.dart';

class RelatedItems extends StatefulWidget {
  final String image;
  final String name;
  final Color topBackgroundColor;
  final Color bottomBackgroundColor;
  const RelatedItems(
      {super.key,
      required this.image,
      required this.name,
      required this.topBackgroundColor,
      required this.bottomBackgroundColor});
  @override
  State<StatefulWidget> createState() => _RelatedItems();
}

class _RelatedItems extends State<RelatedItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16),
          height: 112,
          width: 116,
          decoration: BoxDecoration(
              color: widget.topBackgroundColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                widget.image,
                height: 76,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [SvgPicture.asset(AppLogos.addIconn)],
              )
            ],
          ),
        ),
        Container(
          height: 44,
          width: 116,
          decoration: BoxDecoration(
              color: widget.bottomBackgroundColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              )),
          child: Center(
            child: Text(
              widget.name,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
