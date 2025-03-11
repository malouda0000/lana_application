import 'package:eloro_shop_uae/core/constants/app_constants.dart';
import 'package:eloro_shop_uae/core/themes/app_colors.dart';
import 'package:eloro_shop_uae/view/Auth/register/widgets/auth_custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

TextEditingController patientNameTextEditingController =
    TextEditingController();

TextEditingController patientAgeTextEditingController = TextEditingController();

final GlobalKey<FormState> _reserveFormKey = GlobalKey<FormState>();

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppConstants.emptySpaceFifteenPixl,
        AppConstants.emptySpaceFifteenPixl,
        AuthCustomIcon(),
        AppConstants.emptySpaceFifteenPixl,
        AppConstants.emptySpaceFifteenPixl,
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.theDefBaddingFifteenPixl),
          child: Form(
              key: _reserveFormKey,
              child: Column(
                children: [
                  _PatientNameFeild(),
                  AppConstants.emptySpaceFifteenPixl,
                  _PatientAgeFeild(),
                ],
              )),
        ),
        Spacer(),
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
    );
  }
}

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
