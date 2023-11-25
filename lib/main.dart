
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_fonts.dart';
import 'package:vippro_project/screens/main_page.dart';
import 'package:vippro_project/screens/splash/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
SharedPreferences? prefs;

void main()async {
  runApp(const MyApp());
  initSharedPreference();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> initSharedPreference() async {
  prefs = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppFonts.themeTextFont,
        scaffoldBackgroundColor: AppColors.whiteColor,
      ),
      home: const GroceryApp(),
    );
  }
}

class GroceryApp extends StatefulWidget {
  const GroceryApp({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Splash(),
      ),
    );
  }
}
