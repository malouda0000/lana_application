
import 'package:eloro_shop_uae/core/themes/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

customAppToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    // backgroundColor: AppColors.mainGreyColor,
    backgroundColor: AppColors.mainColor,
    textColor: AppColors.bgColor,
    fontSize: 12,
  );
}
