import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippro_project/data/screenData/cartScreen/listCart.dart';
import 'package:vippro_project/screens/cartScreen/widgets/listviewItems.dart';
import 'package:vippro_project/widgets/count_button.dart';
import '../../base/app_colors.dart';
import '../../base/logo.dart';
import '../../widgets/app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CartScreen();
}

class _CartScreen extends State<CartScreen> {
  String dropdownValue = list.first;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppLogos.backLogo,
            )),
        appBarChild: const Text(
          ' My Cart',
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: SvgPicture.asset(
                          'assets/cartScreenImg/dropDownIcon.svg'),
                      elevation: 16,
                      style: const TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: 'MonserratSemiBold',
                          fontSize: 20),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 380,
                child: ListView.builder(
                    itemCount: listCart.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 116,
                        margin: index == listCart.length - 1
                            ? const EdgeInsets.only(bottom: 0)
                            : const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                offset: const Offset(0, 3),
                                blurRadius: 3,
                                spreadRadius: 1,
                              )
                            ]),
                        child: CartItems(image: listCart[index].cartImage,
                          name: listCart[index].cartName,
                          weight: listCart[index].cartWeight,
                          price: listCart[index].cartPrice,
                          oldPrice: listCart[index].cartOldPrice,
                          clickRemoveItem: () {
                          setState(() {
                            listCart.removeAt(index);
                          });
                          },
                        )
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> list = [
  'Tomorrow,7 AM - 9 PM',
  '09/10/2023,7 AM - 9 PM',
  '10/10/2023,7 AM - 9 PM'
];
