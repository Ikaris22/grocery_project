import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/base/app_strings.dart';

import 'package:vippro_project/screens/addNewAddress/index.dart';
import 'package:vippro_project/screens/editAddress/edit_address.dart';
import 'package:vippro_project/screens/myAddresses/widget/address_item.dart';
import 'package:vippro_project/widgets/green_appbar.dart';

import '../../base/app_images.dart';
import '../../data/local/db_helper.dart';
import '../../data/model/address.dart';

class MyAddresses extends StatefulWidget {
  const MyAddresses({super.key});

  @override
  State<StatefulWidget> createState() => _MyAddresses();
}

class _MyAddresses extends State<MyAddresses> {
  List<Address> address = [];

  @override
  void initState() {
    loadAddress();
    super.initState();
  }

  Future<void> loadAddress() async {
    final db = await DBHelper.instance.database;
    final data = await db.rawQuery('SELECT * FROM addressTable');
    setState(() {
      address = List.generate(data.length, (index) {
        return Address(
          id: int.parse(data[index]['id'].toString()),
          country: data[index]['country'].toString(),
          state: data[index]['state'].toString(),
          city: data[index]['city'].toString(),
          pincode: data[index]['pincode'].toString(),
          type: data[index]['type'].toString(),
          isCheck: int.parse(data[index]['isCheck'].toString()) == 1,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppbar(
        title: MyAddressesStrings.appbarTitle,
        clickBack: () {
          Navigator.pop(context);
        },
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.greenColor,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 28,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    final resultAdd = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddNewAddress()),
                    );
                    if (resultAdd == true) {
                      loadAddress();
                    }
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppLogos.addIconOutlined
                      ),
                      const Gap(8),
                      const Text(
                        MyAddressesStrings.addNewAddress,
                        style: TextStyle(
                          fontSize: 21,
                          color: AppColors.greenColor,
                          fontFamily: AppFonts.monserratSemiBold,
                        ),
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
                const Gap(4),
                Expanded(
                  child: ListView.builder(
                      itemCount: address.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Checkbox(
                              shape: const CircleBorder(),
                              value: address[index].isCheck,
                              onChanged: (bool? value) {
                                setState(() {
                                  for (int i = 0; i < address.length; i++) {
                                    address[i].isCheck = false;
                                    updateAddress(Address(
                                      id: address[i].id,
                                      country: address[i].country,
                                      state: address[i].state,
                                      city: address[i].city,
                                      pincode: address[i].pincode,
                                      type: address[i].type,
                                      isCheck: false,
                                    ));
                                  }
                                  address[index].isCheck = true;
                                  updateAddress(Address(
                                    id: address[index].id,
                                    country: address[index].country,
                                    state: address[index].state,
                                    city: address[index].city,
                                    pincode: address[index].pincode,
                                    type: address[index].type,
                                    isCheck: true,
                                  ));
                                });
                              },
                            ),
                            AddressItem(
                              country: address[index].country,
                              state: address[index].state,
                              city: address[index].city,
                              pincode: address[index].pincode,
                              type: address[index].type,
                              clickEdit: () async {
                                final resultEdit = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditAddress(
                                          editAddress: address[index])),
                                );
                                if (resultEdit == true) {
                                  loadAddress();
                                }
                              },
                              clickDelete: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                      'Do you want to delete this address?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('CANCEL'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          if (address[index].id == null) {
                                          } else {
                                            deleteAddress(address[index].id!);
                                            address.removeAt(index);
                                            Navigator.pop(context);
                                          }
                                        });
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                              iconType: checkIconType(index: index),
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  checkIconType({required int index}) {
    if (address[index].type == 'Home') {
      return AppLogos.homeIcon;
    } else {
      if (address[index].type == 'Office') {
        return AppLogos.officeIcon;
      } else {
        return AppLogos.otherIcon;
      }
    }
  }
}
