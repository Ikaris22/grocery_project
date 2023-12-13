import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/screens/payment/widget/image_page.dart';
import 'package:vippro_project/screens/payment/widget/payment_method.dart';
import 'package:vippro_project/screens/payment/widget/title.dart';
import 'package:vippro_project/screens/privacyPolicy/index.dart';
import 'package:vippro_project/widgets/address_textfield.dart';
import 'package:vippro_project/widgets/contact_textfield.dart';
import 'package:vippro_project/widgets/green_appbar.dart';
import 'package:vippro_project/widgets/log_elevated_button.dart';
import '../../base/app_colors.dart';
import '../../base/app_fonts.dart';
import '../../base/app_images.dart';
import '../../data/local/db_helper.dart';
import '../../data/model/address.dart';
import '../editAddress/edit_address.dart';
import '../myAddresses/widget/address_item.dart';
import '../myWallet/index.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<StatefulWidget> createState() => _Payment();
}

enum RadioGroup { cod, upi, wallet, card }

class _Payment extends State<Payment> {
  List<Address> address = [];
  List<String> images = [AppImages.card1, AppImages.card1, AppImages.card1];

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

  bool checkHome = false;
  bool checkOffice = false;
  bool checkOther = false;
  late TextEditingController countryController;
  late TextEditingController stateController;
  late TextEditingController cityController;
  late TextEditingController pincodeController;

  String checkType() {
    if (checkOffice == true) {
      return 'Office';
    } else {
      if (checkHome == true) {
        return 'Home';
      } else {
        return 'Other';
      }
    }
  }

  dialogMissing() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Address must be filled in completely'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  dialogCheck() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Column(
          children: [Text('Do you want to save this address?')],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pop();
                dialogComplete();
                insertAddress(Address(
                    id: null,
                    country: countryController.text,
                    state: stateController.text,
                    city: cityController.text,
                    pincode: pincodeController.text,
                    type: checkType()));
              });
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  bool checkPincode() {
    RegExp regex = RegExp(r"^\d{6}$");
    return regex.hasMatch(pincodeController.text);
  }

  dialogPincode() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Column(
          children: [
            Text(
              AddNewAddressStrings.pinCodeSnackBar,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.greenColor,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  dialogComplete() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Column(
          children: [
            Text('Your address has been saved'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              loadAddress();
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  bool isVisible = false;
  int selectedIndex = 0;
  RadioGroup _selectedRadio = RadioGroup.cod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppbar(
        title: PaymentStrings.appBarTitle,
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
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              top: 20,
              left: 16,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        contactDetail(),
                        const Gap(20),
                        deliveryAddress(),
                        const Gap(28),
                        promoCode(),
                        const Gap(16),
                        paymentMethod(),
                        const Gap(12),
                      ],
                    ),
                  ),
                  creditCard(),
                  const Gap(20),
                  LogElevatedButton(
                    buttonWidth: 180,
                    buttonName: PaymentStrings.pay,
                    onClick: () {},
                    radius: 8,
                  ),
                  const Gap(20),
                  text(),
                  const Gap(80),
                ],
              ),
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

  contactDetail() {
    return const Column(children: [
      TitlePayment(
        title: PaymentStrings.contactDetails,
        fontSize: 22,
      ),
      Gap(20),
      ContactTextField(),
    ]);
  }

  deliveryAddress() {
    return Column(
      children: [
        const TitlePayment(
          title: PaymentStrings.chooseDelivery,
          fontSize: 22,
        ),
        Container(
          height: 180 * address.length.toDouble(),
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 16),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
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
                              builder: (context) =>
                                  EditAddress(editAddress: address[index])),
                        );
                        if (resultEdit == true) {
                          loadAddress();
                        }
                      },
                      clickDelete: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title:
                              const Text('Do you want to delete this address?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
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
        ),
        InkWell(
          onTap: () {
            setState(() {
              countryController = TextEditingController();
              stateController = TextEditingController();
              cityController = TextEditingController();
              pincodeController = TextEditingController();
              checkOffice = false;
              checkHome = false;
              checkOffice = false;
            });
            showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 32,
                          right: 32,
                          bottom: MediaQuery.of(context).viewInsets.bottom/1.8,
                        ),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  MyAddressesStrings.addNewAddress,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: AppColors.greenColor,
                                    fontFamily: AppFonts.monserratSemiBold,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(16),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                children: [
                                  AddressTextField(
                                    textFieldName: AddNewAddressStrings.country,
                                    controller: countryController,
                                  ),
                                  const Gap(16),
                                  AddressTextField(
                                    textFieldName: AddNewAddressStrings.state,
                                    controller: stateController,
                                  ),
                                  const Gap(16),
                                  AddressTextField(
                                    textFieldName: AddNewAddressStrings.city,
                                    controller: cityController,
                                  ),
                                  const Gap(16),
                                  AddressTextField(
                                    textFieldName: AddNewAddressStrings.pincode,
                                    controller: pincodeController,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                    value: checkHome,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        checkHome = value!;
                                        if (checkHome == true) {
                                          checkOffice = false;
                                          checkOther = false;
                                        }
                                      });
                                    }),
                                const Text(
                                  AddNewAddressStrings.home,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFonts.monserratRegular,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Checkbox(
                                    value: checkOffice,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        checkOffice = value!;
                                        if (checkOffice == true) {
                                          checkHome = false;
                                          checkOther = false;
                                        }
                                      });
                                    }),
                                const Text(
                                  AddNewAddressStrings.office,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFonts.monserratRegular,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Checkbox(
                                    value: checkOther,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        checkOther = value!;
                                        if (checkOther == true) {
                                          checkHome = false;
                                          checkOffice = false;
                                        }
                                      });
                                    }),
                                const Text(
                                  AddNewAddressStrings.other,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFonts.monserratRegular,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(8),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: LogElevatedButton(
                                  buttonWidth: 200,
                                  buttonName: AddNewAddressStrings.save,
                                  onClick: () {
                                    setState(() {
                                      if (countryController.text.isEmpty ||
                                          stateController.text.isEmpty ||
                                          cityController.text.isEmpty ||
                                          pincodeController.text.isEmpty ||
                                          (checkHome == false &&
                                              checkOther == false &&
                                              checkOffice == false)) {
                                        dialogMissing();
                                      } else {
                                        if (checkPincode() == true) {
                                          dialogCheck();
                                        } else {
                                          dialogPincode();
                                        }
                                      }
                                    });
                                  },
                                  radius: 4),
                            ),
                            const Gap(24),
                          ],
                        ),
                      ),
                    );
                  });
                });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                AppLogos.addIconOutlined,
                height: 18,
              ),
              const Gap(8),
              const Text(
                MyAddressesStrings.addNewAddress,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.greenColor,
                  fontFamily: AppFonts.monserratSemiBold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  promoCode() {
    return Column(
      children: [
        const TitlePayment(
          title: PaymentStrings.question,
          fontSize: 18,
        ),
        const Gap(20),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.dividerColor,
            hintStyle: const TextStyle(
              fontSize: 18,
              color: AppColors.subscriptionQty,
            ),
            hintText: PaymentStrings.enterCode,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 32, right: 12),
              child: SvgPicture.asset(
                AppLogos.hintPromoCode,
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            contentPadding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          ),
        ),
        const Gap(20),
        LogElevatedButton(
            buttonWidth: 180,
            buttonName: PaymentStrings.applyButton,
            onClick: () {},
            radius: 8),
      ],
    );
  }

  paymentMethod() {
    return Column(
      children: [
        const TitlePayment(
          title: PaymentStrings.choosePayment,
          fontSize: 22,
        ),
        PaymentMethod(
          methodName: PaymentStrings.cod,
          radio: Radio(
            activeColor: AppColors.greenColor,
            value: RadioGroup.cod,
            groupValue: _selectedRadio,
            onChanged: (RadioGroup? value) {
              setState(() {
                _selectedRadio = value!;
                _selectedRadio == RadioGroup.card
                    ? isVisible = true
                    : isVisible = false;
              });
            },
          ),
        ),
        PaymentMethod(
          methodName: PaymentStrings.upi,
          radio: Radio(
            activeColor: AppColors.greenColor,
            value: RadioGroup.upi,
            groupValue: _selectedRadio,
            onChanged: (RadioGroup? value) {
              setState(() {
                _selectedRadio = value!;
                _selectedRadio == RadioGroup.card
                    ? isVisible = true
                    : isVisible = false;
              });
            },
          ),
        ),
        PaymentMethod(
          methodName: PaymentStrings.wallet,
          radio: Radio(
            activeColor: AppColors.greenColor,
            value: RadioGroup.wallet,
            groupValue: _selectedRadio,
            onChanged: (RadioGroup? value) {
              setState(() {
                _selectedRadio = value!;
                _selectedRadio == RadioGroup.card
                    ? isVisible = true
                    : isVisible = false;
              });
            },
          ),
        ),
        PaymentMethod(
          methodName: PaymentStrings.card,
          radio: Radio(
            activeColor: AppColors.greenColor,
            value: RadioGroup.card,
            groupValue: _selectedRadio,
            onChanged: (RadioGroup? value) {
              setState(() {
                _selectedRadio = value!;
                _selectedRadio == RadioGroup.card
                    ? isVisible = true
                    : isVisible = false;
              });
            },
          ),
        ),
      ],
    );
  }

  creditCard() {
    return Visibility(
      visible: isVisible,
      child: Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    AppLogos.addIconOutlined,
                    height: 18,
                  ),
                  const Gap(8),
                  const Text(
                    PaymentStrings.addNewCard,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.greenColor,
                      fontFamily: AppFonts.monserratSemiBold,
                    ),
                  ),
                  const Gap(16),
                ],
              ),
            ),
            SizedBox(
                height: 180,
                child: PageView.builder(
                    controller: PageController(viewportFraction: 0.6),
                    onPageChanged: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      double scale = index == selectedIndex ? 1 : 0.85;
                      return TweenAnimationBuilder(
                        curve: Curves.easeIn,
                        tween: Tween(begin: scale, end: scale),
                        duration: const Duration(milliseconds: 100),
                        builder: (BuildContext context, Object? value,
                            Widget? child) {
                          return Transform.scale(
                            scale: scale,
                            child: child,
                          );
                        },
                        child: ImagePage(
                          image: images[index],
                          isSelected: selectedIndex == index,
                          clickNavigator: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyWallet(),
                              ),
                            );
                          },
                        ),
                      );
                    })),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                right: 32,
              ),
              child: Stack(
                children: [
                  Container(
                      height: 42,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Gap(20),
                          Text(
                            PaymentStrings.enterCvv,
                            style: TextStyle(
                                fontSize: 16, color: AppColors.whiteColor),
                          )
                        ],
                      )),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 42,
                      width: MediaQuery.of(context).size.width / 1.8,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.greenColor,
                          width: 1.0,
                        ),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: PaymentStrings.hintCvv,
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors.subscriptionQty,
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 16,
                            top: 12,
                            bottom: 12,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  text() {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        const TextSpan(
            text: PaymentStrings.text,
            style: TextStyle(
              color: AppColors.subscriptionQty,
              fontSize: 14,
              fontFamily: AppFonts.monserratRegular,
            )),
        TextSpan(
          text: PaymentStrings.privacy,
          style: const TextStyle(
            color: AppColors.greenColor,
            fontSize: 14,
            fontFamily: AppFonts.monserratRegular,
            fontWeight: FontWeight.bold,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
              );
            },
        ),
      ]),
    );
  }
}
