import 'package:eloro_shop_uae/core/constants/app_constants.dart';
import 'package:eloro_shop_uae/core/func/nav_func.dart';
import 'package:eloro_shop_uae/core/themes/app_colors.dart';
import 'package:eloro_shop_uae/view/Auth/register/widgets/auth_custom_icon.dart';
import 'package:eloro_shop_uae/view/shared/product_container.dart';
import 'package:eloro_shop_uae/view/shared/screens/under_deve_screen.dart';
import 'package:eloro_shop_uae/view/shared/search_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter/widgets.dart'; // Unused if material.dart is imported

TextEditingController patientNameTextEditingController =
    TextEditingController();

TextEditingController patientAgeTextEditingController = TextEditingController();

final GlobalKey<FormState> _reserveFormKey = GlobalKey<FormState>();

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
            horizontal: AppConstants.theDefBaddingFifteenPixl),
        children: [
          AppConstants.emptySpaceFifteenPixl,
          AppConstants.emptySpaceFifteenPixl,
          AuthCustomIcon(),
          AppConstants.emptySpaceFifteenPixl,
          AppConstants.emptySpaceFifteenPixl,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchContainer(),
          ),
          AppConstants.emptySpaceFifteenPixl,
          AppConstants
              .emptySpaceFifteenPixl, // Assuming this was what 'emptyGutter' was meant to be
          Padding(
            padding: const EdgeInsets.symmetric(// Kept original padding logic
                /*horizontal: AppConstants.theDefBaddingFifteenPixl*/), // This inner padding on Form was likely the issue spot along with nested ListView
            child: Form(
                key: _reserveFormKey,
                child: Column(
                  children: [
                    // _PatientNameFeild(),
                    // AppConstants.emptySpaceFifteenPixl,
                    // _PatientAgeFeild(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Suppliers:",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBgColor,
                            fontFamily: "Cairo",
                          ),
                        ),
                      ],
                    ),

                    Column(
                      // Using a Column to contain the list of products
                      mainAxisSize: MainAxisSize
                          .min, // Important to constrain the Column if not using Expanded
                      children: [
                        AppConstants.emptySpaceTenPixl,
                        for (int i = 1; i < 20; i++)
                          // ProductContainer(
                          //   brandName: "zara",
                          //   brandNetworkImage: null,
                          //   isDisscountOrNew: true, // Kept original
                          //   isFavourated: true,
                          //   isDiscountOrNew: true,
                          //   hasPaddings: true,
                          //   productName: 't-shirt',
                          //   categoryName: 'men',
                          //   productDiscreption:
                          //       'this is just a test for the product discription, and so on',
                          //   oldPrice: '499',
                          //   newPrice: '299',
                          //   productNetworkImage: null,
                          //   productRating: 4.5,
                          //   onTapProductWidget: () {
                          //     // navigateTo(context, ProductDetailsScreen());
                          //   },
                          //   onTapAddOrRemoveFav: () {
                          //     navigateTo(context, UnderDevScreen());
                          //   },
                          // ),

                          ProductContainer(),
                      ],
                    ),
                  ],
                )),
          ),
          Spacer(), // Kept as original
          AppConstants.emptySpaceFifteenPixl,
          AppConstants.emptySpaceFifteenPixl,
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.theDefBaddingFifteenPixl),
            child: _ConfirmCustomButton(),
          ),
          AppConstants.emptySpaceFifteenPixl,
          AppConstants.emptySpaceFifteenPixl,
        ],
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      padding: const EdgeInsets.all(10.0), // Added padding for better spacing
      height: 100, // Adjust height as needed
      width: double.infinity,

      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),

        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product Category",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Product supplier",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   "Product rating",
                //   style: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                RatingBar(
                  onRatingUpdate: (rating) {
                    // Handle rating update if needed
                  },
                  glow: false,
                  ignoreGestures: true,
                  initialRating: 4.5,
                  itemSize: 25,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                    full: Icon(
                      Icons.star_rounded,
                      color: AppColors.mainColor,
                      size: 5,
                    ),
                    half: Icon(
                      Icons.star_half_rounded,
                      color: AppColors.mainColor,
                      size: 5,
                    ),
                    empty: Icon(
                      Icons.star_outline_rounded,
                      color: AppColors.mainColor,
                      size: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "\$99.99",
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ... rest of your original code for _PatientNameFeild, _PatientAgeFeild, _ConfirmCustomButton remains UNCHANGED ...
// Assuming AppConstants looks something like this (for the code to run):
class AppConstants {
  static const SizedBox emptySpaceFifteenPixl = SizedBox(height: 15, width: 15);
  static const SizedBox emptySpaceTenPixl = SizedBox(height: 10, width: 10);
  static const double theDefBaddingFifteenPixl = 15.0;
  static const Border customBorderOnePixel = Border(); // Placeholder
  // ... other constants
}

// Keeping the classes exactly as they were, no internal changes:
class _PatientNameFeild extends StatelessWidget {
  const _PatientNameFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // email or phone number
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        // boxShadow: AppConstants.theLightBoxShdow,
        border: AppConstants.customBorderOnePixel,
        color: Colors.white,
      ),
      child: TextFormField(
        // name: AppLocalizations.of(context)!.email,

        // #### fully working validator #### //
        // #### #### //
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a valid name';
          }
          if (value.length < 3) {
            return 'the name must be at least 3 characters long';
          }
          return null;
        },
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            height: .8,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        controller: patientNameTextEditingController,
        decoration: InputDecoration(
          // the hint text was S.email but i change it for S.phoneNumber
          // hintText: AppLocalizations.of(context)!.email,
          hintText: "patient name",
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              height: .8,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black),
          border: InputBorder.none,
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}

class _PatientAgeFeild extends StatelessWidget {
  const _PatientAgeFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // email or phone number
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        // boxShadow: AppConstants.theLightBoxShdow,
        border: AppConstants.customBorderOnePixel,
        color: Colors.white,
      ),
      child: TextFormField(
        // name: AppLocalizations.of(context)!.email,

        // #### fully working validator #### //
        // #### #### //

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your age';
          }
          final int? age = int.tryParse(value);
          if (age == null) {
            return 'Please enter a valid number';
          }
          if (age < 10 || age > 100) {
            return 'Age must be between 10 and 100';
          }
          return null;
        },

        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            height: .8,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        controller: patientAgeTextEditingController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          // the hint text was S.email but i change it for S.phoneNumber
          // hintText: AppLocalizations.of(context)!.email,
          hintText: "patient age",
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              height: .8,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black),
          border: InputBorder.none,

          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}

class _ConfirmCustomButton extends StatelessWidget {
  const _ConfirmCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        10,
      ),
      onTap: () {
        // signInFormKey.currentState!.validate() == true
        //     ? print("${signInFormKey.currentState!.validate()}")
        //     : print("${signInFormKey.currentState!.validate()}");
        if (_reserveFormKey.currentState!.validate() == true) {
          print("==============================confirm");
        }
      },
      child: Container(
        height: 40,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          // AppLocalizations.of(context)!.signIn,
          "Confirm",
        ),
      ),
    );
  }
}

// Assume AppColor
