import 'package:eloro_shop_uae/core/constants/app_constants.dart';
import 'package:eloro_shop_uae/core/constants/app_images.dart';
import 'package:eloro_shop_uae/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AuthCustomIcon extends StatelessWidget {
  const AuthCustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: AppConstants.theNewBorderRadiusTenPX,
            color: AppColors.darkBgColor,
          ),
          child: const Image(
            image: AssetImage(
              AppImages.appersLogoLight,
            ),
            height: 200, // Set the height
            width: 200, // Set the width
            fit: BoxFit
                .contain, // Ensures the image scales to fit within the dimensions
          ),
        ),
        AppConstants.emptySpaceTenPixl,
        Text(
          "APPERS SHOP UAE",
          style:
              AppConstants.customTitleTextStyle.copyWith(color: Colors.black),
        ),
        AppConstants.emptySpaceTenPixl,
        AppConstants.emptySpaceTenPixl,
      ],
    );
  }
}
