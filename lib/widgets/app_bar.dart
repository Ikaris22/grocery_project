import 'package:flutter/material.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  final Widget appBarChild;
  const AppBars({
    super.key,
    required this.appBarChild,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 56,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Container(
        padding: const EdgeInsets.only(top: 5),
        child: appBarChild,
      ),
      centerTitle: true,
    );
  }
  @override
  Size get preferredSize => const Size(0, 56);
}
