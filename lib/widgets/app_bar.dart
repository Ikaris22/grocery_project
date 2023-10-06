import 'package:flutter/material.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  const AppBars({super.key, required this.appBarChild, required this.leading});
  final Widget appBarChild;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: false,
      toolbarHeight: 56,
      backgroundColor: Colors.white,
      elevation: 0,
      title:
          Container(padding: const EdgeInsets.only(top: 5), child: appBarChild),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size(0, 56);
}
