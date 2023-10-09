import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../base/app_colors.dart';

class StackChild extends StatefulWidget {
  const StackChild(
      {super.key,
      required this.image,
      required this.name,
      required this.weight,
      required this.price});

  final String image;
  final String name;
  final String weight;
  final String price;

  @override
  State<StatefulWidget> createState() => _StackChild();
}

class _StackChild extends State<StackChild> {
  String icon = 'assets/listFruitsImage/heart_ic.svg'; //TODO: dua cai nay vao file app_images.dart
  int count = 1;
  Color buttonColor = AppColors.greenColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 28),
            Image.asset(
              widget.image,
              height: 80,
            ),
            Row(
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text('(${widget.weight})')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.price,
                  style: const TextStyle(
                    color: AppColors.greenColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            count > 1 ? count-- : count = count;
                          });
                        },
                        icon: SvgPicture.asset(
                          'assets/listFruitsImage/ic_remove.svg', //TODO: dua cai nay vao file app_images.dart
                        ),
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    Text(count.toString(),
                        style: const TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            count++;
                          });
                        },
                        icon: SvgPicture.asset(
                          'assets/listFruitsImage/icon_add.svg', //TODO: dua cai nay vao file app_images.dart
                        ),
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        buttonColor == AppColors.greenColor
                            ? buttonColor = const Color.fromRGBO(143, 143, 143, 1)
                            : buttonColor = AppColors.greenColor;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      minimumSize: const Size(
                        40,
                        28,
                      ),
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                    ),
                    child: const Text(
                      'Subscribe', //TODO: dua cai nay vao file app_texts.dart
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(
                        40,
                        28,
                      ),
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      side: const BorderSide(
                        color: AppColors.greenColor,
                      ),
                    ),
                    child: const Text(
                      'Buy Once', //TODO: dua cai nay vao file app_texts.dart
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.greenColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: 4,
          left: 124,
          child: IconButton(
              onPressed: () {
                setState(() {
                  icon == 'assets/listFruitsImage/heart_ic.svg' //TODO: dua cai nay vao file app_images.dart
                      ? icon = 'assets/listFruitsImage/red_heart_ic.svg' //TODO: dua cai nay vao file app_images.dart
                      : icon = 'assets/listFruitsImage/heart_ic.svg'; //TODO: dua cai nay vao file app_images.dart
                });
              },
              icon: SvgPicture.asset(icon)),
        ),
      ],
    );
  }
}
