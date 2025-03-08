// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:special_line_vendors/core/constants/app_constants.dart';
// import 'package:special_line_vendors/core/constants/app_images.dart';
// import 'package:special_line_vendors/core/func/nav_func.dart';
// import 'package:special_line_vendors/core/themes/app_colors.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:special_line_vendors/view/Auth/forget%20password%20screen/bloc/forgot_password_bloc.dart';
// import 'package:special_line_vendors/view/Auth/login/login_screen.dart';
// import 'package:special_line_vendors/view/Auth/otp%20screen/otp_screen.dart';
// import 'package:special_line_vendors/view/shared/screens/error_screen.dart';
// import 'package:special_line_vendors/view/shared/screens/loading_screen.dart';
// import 'package:special_line_vendors/view/shared/widgets/app_button.dart';

// TextEditingController _emailTextEditingContorller = TextEditingController();
// TextStyle _customLocalTextStyle = const TextStyle(
//   color: AppColors.greyColor,
//   height: .8,
//   fontSize: 16,
//   fontWeight: FontWeight.w500,
// );

// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//             child: SizedBox(
//           width: double.infinity,
//           height: 600,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               vertical: 20,
//               horizontal: 15,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(width: 160, AppImages.logoLight),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                           // height: .8,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                     AppLocalizations.of(context)!.resetPassword),
//                 // const SizedBox(
//                 //   height: 20,
//                 // ),
//                 Text(
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         // height: .8,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                   AppLocalizations.of(context)!.enterEmailToResetOne,
//                 ),
//                 Text(
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         // height: .8,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                   AppLocalizations.of(context)!.enterEmailToResetTwo,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 // Form(
//                 //   child: AppTextFormField(
//                 //     controller: _emailTextEditingContorller,
//                 //     onChanged: (p0) {},
//                 //     validator: (p0) {},
//                 //     shadow: true,
//                 //     hintText: AppLocalizations.of(context)!.email,
//                 //     borderRaduis: 10,

//                 //   ),
//                 // ),
//                 BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
//                   listener: (context, state) {
//                     // TODO: implement listener
//                     if (state is ForgotPasswordSuccessState) {
//                       navigateToWithReplacement(context, const OtpScreen());
//                     }
//                   },
//                   builder: (context, state) {
//                     if (state is ForgotPasswordLoadingState) {
//                       return Center(
//                         child: CustomLoadingScreen(),
//                       );
//                     }
//                     if (state is ForgotPasswordErrorState) {
//                       return Center(
//                         child: ErrorScreen(
//                           errorMessage: "unknnown error",
//                         ),
//                       );
//                     }

//                     return Column(
//                       children: [
//                         _UserEmailFormFeild(),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         AppButton(
//                           title: AppLocalizations.of(context)!.sendCode,
//                           textColor: Colors.white,
//                           width: double.infinity,
//                           backgroundColor: AppColors.mainColor,
//                           borderRadius: 50,
//                           onTap: () {
//                             // validate
//                             // contorller.resetpassword
//                             BlocProvider.of<ForgotPasswordBloc>(context).add(
//                               ForgotPasswordRequestEvent(
//                                 email: _emailTextEditingContorller.text.trim(),
//                                 theContext: context,
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 InkWell(
//                     onTap: () {
//                       navigateToWithReplacement(context, const LogInScreen());
//                     },
//                     child: Text(
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                             height: .8,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black,
//                           ),
//                       AppLocalizations.of(context)!.backToSignIn,
//                     )),
//               ],
//             ),
//           ),
//         )),
//       ),
//     );
//   }
// }

// class _UserEmailFormFeild extends StatelessWidget {
//   const _UserEmailFormFeild({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // user email feild
//       // decoration: BoxDecoration(
//       //     borderRadius: BorderRadius.circular(
//       //       10,
//       //     ),
//       //     boxShadow: AppConstants.theLightBoxShdow,
//       //     border: AppConstants.customBorderTwoPixel,
//       //     color: Colors.white),

//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         // boxShadow: AppConstants.theLightBoxShdow,
//         border: AppConstants.customBorderOnePixel,
//         color: Colors.white,
//       ),
//       child: FormBuilderTextField(
//         name: AppLocalizations.of(context)!.email,
//         keyboardType: TextInputType.emailAddress,
//         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//               height: .8,
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//         controller: _emailTextEditingContorller,
//         // validator: (value) {
//         //  if ( value!.length < 4 ) {
//         //   return
//         //   "too short" ; }
//         //   return null;
//         // },
//         validator: (String? value) {
//           if (value == null || value.isEmpty) {
//             return null;
//           } else if (value.length < 5) {
//             return 'Please enter a valid email';
//           }
//           // if (value == null || value.isEmpty || value.length < 5) {
//           //   return 'Please enter an email';
//           // }
//           // final emailPattern =
//           //     RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
//           // if (!emailPattern.hasMatch(value)) {
//           //   return 'Please enter a valid email address';
//           // }
//           ///
//           ///
//           ///
//           ///
//           // const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
//           //     r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
//           //     r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
//           //     r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
//           //     r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
//           //     r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
//           //     r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
//           // final regex = RegExp(pattern);
//           // if (value.isNotEmpty && !regex.hasMatch(value)) {
//           //   return 'Enter a valid email address';
//           //   // : null;
//           // }

//           return null;
//         },
//         decoration: InputDecoration(
//           hintText: AppLocalizations.of(context)!.email,
//           // hintStyle: _customLocalTextStyle,
//           hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                 height: .8,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black,
//               ),
//           border: InputBorder.none,
//           contentPadding: EdgeInsetsDirectional.symmetric(
//             horizontal: 20,
//           ),
//         ),
//       ),
//     );
//   }
// }
