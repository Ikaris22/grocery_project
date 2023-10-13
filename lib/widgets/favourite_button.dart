import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteButton extends StatelessWidget {
  final Function() onClick;
  final String icon;
  const FavouriteButton({
    super.key,
    required this.onClick,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48,
      child: IconButton(
        onPressed: onClick,
        icon: SvgPicture.asset(icon),
      ),
    );
  }
}
