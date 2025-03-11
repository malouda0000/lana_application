import 'package:eloro_shop_uae/core/constants/app_constants.dart';
import 'package:eloro_shop_uae/core/themes/app_colors.dart';
import 'package:eloro_shop_uae/view/Auth/register/widgets/auth_custom_icon.dart';
import 'package:eloro_shop_uae/view/shared/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowOrderesScreen extends StatelessWidget {
  const ShowOrderesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          AppConstants.emptySpaceFifteenPixl,
          AppConstants.emptySpaceFifteenPixl,
          AuthCustomIcon(),
          AppConstants.emptySpaceFifteenPixl,
          AppConstants.emptySpaceFifteenPixl,
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.theDefBaddingFifteenPixl),
            child: Column(
              children: [for (int i = 0; i < 10; i++) _Order()],
            ),
          ),
          AppConstants.emptySpaceFifteenPixl,
          AppConstants.emptySpaceFifteenPixl,
        ],
      ),
    );
  }
}

class _Order extends StatelessWidget {
  const _Order({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.mainColor.withOpacity(.2),
        borderRadius: AppConstants.theNewBorderRadiusTenPX,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [CustomTitle(title: "patient name: ")],
      ),
    );
  }
}
