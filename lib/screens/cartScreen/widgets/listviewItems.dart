import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../base/app_colors.dart';
import '../../../widgets/count_button.dart';
class CartItems extends StatefulWidget{
  const CartItems({super.key, required this.image, required this.name, required this.weight, required this.price, required this.oldPrice, required this.clickRemoveItem});
  final String image;
  final String name;
  final String weight;
  final String price;
  final String oldPrice;
  final Function() clickRemoveItem;


  @override
  State<StatefulWidget> createState() => _CartItems();

}

class _CartItems extends State<CartItems>{
  int count =1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                  color: AppColors.backGroundColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset(widget.image),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 0,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  widget.weight,
                  style: const TextStyle(
                      fontWeight: FontWeight.w200),
                ),
                Row(
                  children: [
                    Text(
                      widget.price,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Helvetica'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.oldPrice,
                      style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'Helvetica',
                          color: Colors.grey,
                          decoration:
                          TextDecoration.lineThrough),
                    )
                  ],
                ),
                const SizedBox(height: 16)
              ],
            )
          ],
        ),
        Positioned(
            top: 4,
            left: 340,
            child: SizedBox(
              width: 28,
              height: 28,
              child: IconButton(
                  onPressed: widget.clickRemoveItem,
                  icon: SvgPicture.asset(
                      'assets/cartScreenImg/close_icon.svg')),
            )),
        Positioned(
          top: 60,
            left: 280,
            child: CountButton(
              onClickSubtract: () {
                setState(() {
                  count > 1 ? count-- : count = count;
                });
              },
              onClickAdd: () {
                setState(() {
                  count++;
                });
              },
              count: count.toString(), fontSize: 24, type: CountButtonType.medium,
            ))
      ],
    );
  }

}