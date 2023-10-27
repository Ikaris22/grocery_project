import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/screens/account/widget/profile_item.dart';
import 'package:vippro_project/screens/myAddresses/index.dart';

import '../subscriptions/index.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AccountPageStrings.profile,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(AppImages.avatar),
                  const Column(
                    children: [
                      Text(
                        AccountPageStrings.name,
                        style: TextStyle(fontSize: 19),
                      ),
                      SizedBox(height: 4),
                      Text(
                        AccountPageStrings.email,
                        style: TextStyle(fontWeight: FontWeight.w200),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 8,
              ),
              height: MediaQuery.of(context).size.height / 1.65,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.profileColor,
                  borderRadius: BorderRadius.circular(16)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileItem(
                      icon: AppLogos.myOrders,
                      title: AccountPageStrings.myOrders,
                      onClick: () {},
                    ),
                    ProfileItem(
                      icon: AppLogos.mySubscriptions,
                      title: AccountPageStrings.mySubscriptions,
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MySubscription(),
                          ),
                        );
                      },
                    ),
                    ProfileItem(
                      icon: AppLogos.myAddresses,
                      title: AccountPageStrings.myAddresses,
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyAddresses(),
                          ),
                        );
                      },
                    ),
                    ProfileItem(
                      icon: AppLogos.faq,
                      title: AccountPageStrings.faq,
                      onClick: () {},
                    ),
                    ProfileItem(
                      icon: AppLogos.contactUs,
                      title: AccountPageStrings.contactUs,
                      onClick: () {},
                    ),
                    ProfileItem(
                      icon: AppLogos.about,
                      title: AccountPageStrings.about,
                      onClick: () {},
                    ),
                    ProfileItem(
                      icon: AppLogos.logOut,
                      title: AccountPageStrings.logOut,
                      onClick: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
