import 'package:flutter/material.dart';

import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;

  const BackgroundContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppStyles.height(context),
      width: AppStyles.width(context),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        image: DecorationImage(
          image: AssetImage(kBg),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
