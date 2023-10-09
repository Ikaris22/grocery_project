import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../base/app_colors.dart';

enum CountButtonType { small, medium }

class CountButton extends StatelessWidget {
  final Function() onClickSubtract;
  final Function() onClickAdd;
  final String count;
  final double fontSize;
  final CountButtonType type;

  const CountButton({
    super.key,
    required this.onClickSubtract,
    required this.onClickAdd,
    required this.count,
    required this.fontSize,
    required this.type,
  });
  Widget _addIcon({
    required double width,
    required double height,
    required double heightIcon,
    required Function() onClick,
    required String icon,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: IconButton(
        onPressed: onClick,
        icon: SvgPicture.asset(
          icon,
          height: heightIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double checkSize = type == CountButtonType.small ? 32 : 44;
    final double checkSizeIcon = type == CountButtonType.small ? 16 : 28;
    return Row(
      children: [
        _addIcon(
          width: checkSize,
          height: checkSize,
          heightIcon: checkSizeIcon,
          onClick: onClickSubtract,
          icon: 'assets/listFruitsImage/ic_remove.svg',
        ),
        Text(count,
            style: TextStyle(
              color: AppColors.greenColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            )),
        _addIcon(
          width: checkSize,
          height: checkSize,
          heightIcon: checkSizeIcon,
          onClick: onClickAdd,
          icon: 'assets/listFruitsImage/icon_add.svg',
        )
      ],
    );
  }
}
