import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/screens/editAddress/edit_address.dart';

import '../../../base/app_colors.dart';
import '../../../base/app_fonts.dart';
import '../../../data/model/address.dart';

class AddressItem extends StatefulWidget {
  final String country;
  final String state;
  final String city;
  final String pincode;
  final String type;
  final Function() clickEdit;
  final Function() clickDelete;
  final String iconType;
  const AddressItem({
    super.key,
    required this.country,
    required this.state,
    required this.city,
    required this.pincode,
    required this.type,
    required this.clickEdit,
    required this.clickDelete,
    required this.iconType,
  });
  @override
  State<StatefulWidget> createState() => _AddressItem();
}

class _AddressItem extends State<AddressItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            shape: const CircleBorder(),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            }),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20),
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    offset: const Offset(0, 0),
                    blurRadius: 5,
                    spreadRadius: 2,
                  )
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          widget.iconType,
                          height: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.type,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: widget.clickEdit,
                          child: SvgPicture.asset(AppLogos.editAddress),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: widget.clickDelete,
                          child: SvgPicture.asset(AppLogos.deleteAddress),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: Text(
                    '${widget.country}, ${widget.state}, ${widget.city}, ${widget.pincode}',
                    style:
                        const TextStyle(fontFamily: AppFonts.monserratRegular),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
