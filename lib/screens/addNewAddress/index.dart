import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/data/local/db_helper.dart';
import 'package:vippro_project/data/model/address.dart';
import 'package:vippro_project/widgets/address_textfield.dart';
import 'package:vippro_project/widgets/green_appbar.dart';
import 'package:vippro_project/widgets/log_elevated_button.dart';

import '../../base/app_colors.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _AddNewAddress();
}

class _AddNewAddress extends State<AddNewAddress> {
  bool checkHome = false;
  bool checkOffice = false;
  bool checkOther = false;
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  late final newAddress = Address(
      id: null,
      country: countryController.text,
      state: stateController.text,
      city: cityController.text,
      pincode: pincodeController.text,
      type: checkType());
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

  dialogMising() {
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
                insertAddress(newAddress);
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

  snackBar() {
    return SnackBar(
      content: const Text(
        AddNewAddressStrings.pinCodeSnackBar,
        style: TextStyle(fontSize: 20),
      ),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
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
              Navigator.pop(context, true);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppbar(
        title: AddNewAddressStrings.appbarTitle,
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
              top: 40,
              left: 32,
              right: 32,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
              color: Colors.white,
            ),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      AddressTextField(
                        textFieldName: AddNewAddressStrings.country,
                        controller: countryController,
                      ),
                      const SizedBox(height: 16),
                      AddressTextField(
                        textFieldName: AddNewAddressStrings.state,
                        controller: stateController,
                      ),
                      const SizedBox(height: 16),
                      AddressTextField(
                        textFieldName: AddNewAddressStrings.city,
                        controller: cityController,
                      ),
                      const SizedBox(height: 16),
                      AddressTextField(
                        textFieldName: AddNewAddressStrings.pincode,
                        controller: pincodeController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 80),
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
                            dialogMising();
                          } else {
                            if (checkPincode() == true) {
                              dialogCheck();
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar());
                            }
                          }
                        });
                      },
                      radius: 4),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
