part of "package:eloro_shop_uae/view/Auth/register/register_screen.dart";

class _DoYouHaveAccount extends StatelessWidget {
  const _DoYouHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return const LogInScreen();
        }), (route) => false);
      },
      child: Text(
        style: const TextStyle(
          color: AppColors.mainColor,
          fontSize: 12,
        ),
        // AppLocalizations.of(context)!.youHaveAccount,
        "you have account",
      ),
    );
  }
}

class _OrSignUpWithGoogle extends StatelessWidget {
  const _OrSignUpWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        const Expanded(
          child: Divider(
            // thickness: 15,
            // height: 30,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          style: const TextStyle(
            // color: AppColors.mainGreyColor,
            color: AppColors.mainColor,
            fontSize: 12,
          ),
          // AppLocalizations.of(context)!.orByUsing,
          "or by using",
        ),
        const SizedBox(
          width: 15,
        ),
        const Expanded(
          child: Divider(
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}

class _GoogleIcons extends StatefulWidget {
  final BuildContext theScreenContext;
  const _GoogleIcons({
    super.key,
    required this.theScreenContext, 
  });

  @override
  State<_GoogleIcons> createState() => _GoogleIconsState();
}

class _GoogleIconsState extends State<_GoogleIcons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            customAppToast(
              message:                  // AppLocalizations.of(context)!.underDev,
                  "this screen is under development",
            );
          },
          child: const Image(
              image: AssetImage(
            AppImages.facebook,
          )),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {

            // #### check user agrement #### //
            if (_userAgreementChecked == false) {
              UserExperinceHelper().showCustomDialog(
                  theContext: widget.theScreenContext,
                  // dialogContent: AppLocalizations.of(context)!.userAgrement,
                  dialogContent: "user agrement",
                  confirmButtonTitle: "ok",
                  onConfirm: () async {
                    // setState(() {
                    //   _userAgreementChecked = true;
                    //   // context: the

                    // });

                    // signUpKey.currentState!.setState(() {
                    //   _userAgreementChecked = true;
                    //   print("sssssssssssssssssssssssssssssssss");
                    // });
                    // sign
                    setState(() {});
                    // widget.theScreenContext.widget.

                    Navigator.of(context).pop();
                  });
            }

            // #### every thing is true #### //
            if (_userAgreementChecked == true) {
              context.read<AuthBloc>().add(AuthSignupEvet(
                    theContext: context,
                  ));
            }


          },
          child: const Image(
              image: AssetImage(
            AppImages.google,
          )),
        ),
      ],
    );
  }
}
