import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/base/app_colors.dart';

class ProfileItem extends StatefulWidget {
  final String icon;
  final String title;
  final Function() onClick;
  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onClick,
  });
  @override
  State<StatefulWidget> createState() => _ProfileItem();
}

class _ProfileItem extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
            onPressed: widget.onClick,
            child:  Container(
              width: MediaQuery.of(context).size.width-88,
              child: Row(
                  children: [
                    SvgPicture.asset(widget.icon),
                    const SizedBox(width: 8),
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.profileTextColor,
                          fontFamily: 'MonserratRegular'),
                    ),
                  ],
                ),
            ),
            ),
      ],
    );
  }
}
