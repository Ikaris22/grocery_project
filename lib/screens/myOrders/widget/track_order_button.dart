import 'package:flutter/material.dart';

import '../../../base/app_colors.dart';

class TrackOrderButton extends StatelessWidget {
  const TrackOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.greenColor,
        onPrimary: Colors.white,
      ),
      onPressed: () {},
      child: const SizedBox(
        height: 36,
        width: 84,
        child: Center(
          child: Text('Track Order'),
        ),
      ),
    );
  }
}
