import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eloro_shop_uae/core/constants/app_constants.dart';
import 'package:eloro_shop_uae/core/helpers/cache_helper.dart';
import 'package:eloro_shop_uae/core/helpers/dio_helper.dart';
import 'package:eloro_shop_uae/core/helpers/user_expernce_helper.dart';
import 'package:eloro_shop_uae/main.dart';
import 'package:eloro_shop_uae/view/Auth/login/login_screen.dart';
import 'package:eloro_shop_uae/view/Auth/model/sign_in_model.dart';
import 'package:eloro_shop_uae/view/Auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_status/http_status.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? cashedArabicUserName;
  String? cashedEnglishUserName;
  String? cashedUserID;
  String? cashedUserEmail;
  String? cashedUserToken;
  String? cashedUserPhoneNum;

//
// #### cache user data using shared prefs #### //
  // _cashUserData({
  //   required String token,
  //   String? arabicUserName,
  //   String? englishUserName,
  //   String? userID,
  //   String? userPhoneNumber,
  //   String? userEmail,
  // }) async {
  //   await CacheHelper.setData(key: AppConstants.cachedUserToken, value: token);
  //   await CacheHelper.setData(
  //       key: AppConstants.cachedArabicUserName, value: arabicUserName);
  //   await CacheHelper.setData(
  //       key: AppConstants.cachedEnglishUserName, value: englishUserName);

  //   await CacheHelper.setData(key: AppConstants.cachedUserID, value: userID);
  //   await CacheHelper.setData(
  //       key: AppConstants.cachedUserPhonNum, value: userPhoneNumber);
  //   await CacheHelper.setData(
  //       key: AppConstants.cachedUserEmail, value: userEmail ?? "");

  //   cashedArabicUserName = arabicUserName;
  //   cashedEnglishUserName = englishUserName;
  //   cashedUserID = userID;
  //   cashedUserEmail = userEmail ?? "";
  //   cashedUserToken = token;
  //   cashedUserPhoneNum = userPhoneNumber ?? "";

  //   globalCachedUserToken = token;
  //   // globalCachedUserLang = token;
  //   globalCachedArabicUserName = arabicUserName;
  //   globalCachedEnglishUserName = englishUserName;
  //   globalCachedUserID = userID;
  //   globalCachedUserPhoneNum = userPhoneNumber;
  // }

// #### cache user data using flutter secure storage #### //
  _cashUserData({
    required String token,
    String? arabicUserName,
    String? englishUserName,
    String? userID,
    String? userPhoneNumber,
    String? userEmail,
  }) async {
    await CacheHelper.saveSecureData(
        key: AppConstants.cachedUserToken, value: token);
    await CacheHelper.saveSecureData(
        key: AppConstants.cachedArabicUserName, value: arabicUserName);
    await CacheHelper.saveSecureData(
        key: AppConstants.cachedEnglishUserName, value: englishUserName);

    await CacheHelper.saveSecureData(
        key: AppConstants.cachedUserID, value: userID);
    await CacheHelper.saveSecureData(
        key: AppConstants.cachedUserPhonNum, value: userPhoneNumber);
    await CacheHelper.saveSecureData(
        key: AppConstants.cachedUserEmail, value: userEmail ?? "");

    cashedArabicUserName = arabicUserName;
    cashedEnglishUserName = englishUserName;
    cashedUserID = userID;
    cashedUserEmail = userEmail ?? "";
    cashedUserToken = token;
    cashedUserPhoneNum = userPhoneNumber ?? "";

    globalCachedUserToken = token;
    // globalCachedUserLang = token;
    globalCachedArabicUserName = arabicUserName;
    globalCachedEnglishUserName = englishUserName;
    globalCachedUserID = userID;
    globalCachedUserPhoneNum = userPhoneNumber;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  ///
  ///
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Name cannot be empty';
    }
    if (value.length < 3) {
      return 'Name must be more than 2 charater';
    } else {
      return null;
    }
  }

  String? validateMobile(String? value) {
    if (value!.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }

  customValidator(text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    return null;
  }

  //   String? validatepassword(String? value) {
  //  if ( value != null ){

  //    if (value.isEmpty ) {
  //     return 'password cannot be empty';
  //   }
  //   if (value.length < 4) {
  //     return 'password must be longer than 4 digit';
  //   }
  //  }

  //  else {
  //     return 'password cannot be empty';

  //   }
  // }

  // String? validateEmail(String? value) {
  //   String pattern =
  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   RegExp regex = RegExp(pattern);

  //   if (value != null) {
  //     if (value.isEmpty) {
  //       return 'Email cannot be empty';
  //     }
  //     if (!regex.hasMatch(value)) {
  //       return 'Enter Valid Email';
  //     } else {
  //       return null;
  //     }
  //   } else {
  //     return 'Email cannot be empty';
  //   }
  // }

  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      // #### log in #### //
      emit(AuthLoadingStateSignIn());

      if (event is AuthLogInEvent) {

        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: signInUserEmailTextEditingController.text.trim(),
            password: signInPasswordTextEditingController.text.trim(),
          );

          // if (credential.user?.email != null &&
          //     credential.credential?.accessToken != null) {
          //   await _cashUserData(
          //     token: credential.credential!.accessToken.toString(),
          //     userEmail: credential.user!.email,
          //   );

          //   emit(AuthSuccessStateSignIn());
          // }

          FirebaseAuth auth = FirebaseAuth.instance;
          User? theUser = auth.currentUser;

          if (theUser != null) {
            String? theToken = await theUser.getIdToken();
            await _cashUserData(token: theToken ?? "");
            emit(AuthSuccessStateSignIn());

            print("User is logged in: ${theUser.email}");
          } else {
            print("No user is signed in");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
        }
      }

      // #### singin with google #### //

      if (event is AuthSignInWithGoogeleEvent) {
        emit(AuthLoadingStateSignIn());

        // Check for internet connectivity
        // bool isConnected =
        //     await InternetConnectionChecker.createInstance().hasConnection;
        // if (!isConnected) {
        //   UserExperinceHelper()
        //       .showNetorkCheckerDialog(theContext: event.theContext);
        //   emit(AuthErrorStateSignIn(errorMessage: "No Internet Connection"));
        //   return;
        // }

        try {
          UserCredential newUserCredential = await signInWithGoogle();
          if (newUserCredential != null) {
            // _cashUserData(
            //   token: newUserCredential.credential!.accessToken!,
            //   englishUserName: newUserCredential.additionalUserInfo!.username,
            //   userEmail: newUserCredential.additionalUserInfo!.providerId,
            // );
            print(
                "aaaaaaaaaa-a=a=a=a=a=a=${newUserCredential.credential!.accessToken!}");
          }

// the new logic for caching
          FirebaseAuth auth = FirebaseAuth.instance;
          User? theUser = auth.currentUser;

          if (theUser != null) {
            String? theToken = await theUser.getIdToken();
            await _cashUserData(token: theToken ?? "");
            emit(AuthSuccessStateSignUp());

            print("User is logged in: ${theUser.email}");
          } else {
            print("No user is signed in");
          }
        } catch (e) {
          // Handle error response or exceptions
          if (e is DioException && e.response != null) {
            // Parse error response
            SignInErrorModel errorResponse =
                SignInErrorModel.fromJson(e.response!.data);

            emit(AuthErrorStateSignIn(
              errorMessage: errorResponse.message,
            ));
          } else {
            emit(AuthErrorStateSignIn(
              errorMessage: "An error occurred: ${e.toString()}",
            ));
          }
        }
      }

      // #### singin with google #### //

      // #### log in #### //

      ///
      ///
      ///
      ///

      if (event is AuthSignupEvet) {
        // Emit loading state
        emit(AuthLoadingStateSignUp());

        // Check for network
        // bool result =
        //     await InternetConnectionChecker.createInstance().hasConnection;

        // if (!result) {
        //   // Emit network error state
        //   emit(AuthErrorStateSignUp(errorMessage: 'No Internet connection'));
        //   UserExperinceHelper()
        //       .showNetorkCheckerDialog(theContext: event.theContext);
        //   return;
        // }

        // print(
        //     "nameeeeeeeeeeee ${signUPEngUserNameTextEditingContorller.text}");
        // try {
        // Send the sign-up request
        // Response signupResponse = await DioHelper.signUp(
        //   arabicName: signUPArbUserNameTextEditingContorller.text.trim(),
        //   englishName: signUPEngUserNameTextEditingContorller.text,
        //   email: signUpUserEmailTextEditingController.text,
        //   mobile: signUpUserPhonNumTextEditingController.text,
        //   password: signUpPasswordTextEditingController.text,
        //   passwordConfirmation: signUpconfirmPassTexEdiController.text,
        // );

        // if (signupResponse.statusCode == 200) {
        //   // Parse response
        //   SignUpModel signUpModel = SignUpModel.fromJson(signupResponse.data);

        //   // Cache the user data
        //   await _cashUserData(
        //     token: signUpModel.accessToken ?? '',
        //     arabicUserName: signUpModel.data?.name?.en ?? '',
        //     englishUserName: signUpModel.data?.name?.en ?? '',
        //     userID: signUpModel.data?.id.toString() ?? '',
        //     userEmail: signUpModel.data?.email ?? '',
        //     userPhoneNumber: signUpModel.data?.mobile ?? '',
        //   );
        //   await DioHelper.init();

        //   // Emit success state
        //   emit(AuthSuccessStateSignUp());
        // } else if (signupResponse.statusCode == 422) {
        //   // Handle validation errors
        //   SignUpErrorModel errorResponse =
        //       SignUpErrorModel.fromJson(signupResponse.data);

        //   String errorMessage = errorResponse.errors?['email']?.first ??
        //       'The email has already been taken.';

        //   emit(AuthErrorStateSignUp(errorMessage: errorMessage));
        // } else {
        //   // Handle other unexpected errors

        //   emit(AuthErrorStateSignUp(
        //       errorMessage: signupResponse.statusMessage ?? 'Unknown error'));
        // }

        // } catch (e) {
        //   // Handle exceptions
        //   emit(AuthErrorStateSignUp(errorMessage: 'Exception occurred: $e'));
        // }

// #### firebase sing up #### //

        try {

          if (signUpUserEmailTextEditingController.text.trim().isEmpty) {
  print("Email field cannot be emmmmmmmmmmpty");
  return;
}

          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: signUPEngUserNameTextEditingContorller.text.trim(),
            password: signUpPasswordTextEditingController.text.trim(),
          );

          // if (credential.user?.email != null &&
          //     credential.credential?.accessToken != null) {
          //   await _cashUserData(
          //     token: credential.credential!.accessToken.toString(),
          //     userEmail: credential.user!.email,
          //   );
          //   emit(AuthSuccessStateSignIn());
          // }

// the new logic for caching
          FirebaseAuth auth = FirebaseAuth.instance;
          User? theUser = auth.currentUser;

          if (theUser != null) {
            String? theToken = await theUser.getIdToken();
            await _cashUserData(token: theToken ?? "");
            emit(AuthSuccessStateSignUp());

            print("User is logged in: ${theUser.email}");
          } else {
            print("No user is signed in");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }

        // try {
        //   final credential =
        //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //     email: signUpUserEmailTextEditingController.text.trim(),
        //     password: signUpPasswordTextEditingController.text.trim(),
        //   );

        //        print(
        //         'The passwordddddddddttttttttttdddd ${credential.credential!.accessToken.toString()}');
        //         // 010203AAaa@

        //   if (credential.user?.email != null &&
        //       credential.credential?.accessToken != null) {
        //     print(
        //         'The passworddddddddddddd ${credential.credential!.accessToken.toString()}');

        //     _cashUserData(
        //       token: credential.credential!.accessToken.toString(),
        //       userEmail: credential.user!.email,
        //     );
        //     emit(AuthSuccessStateSignIn());
        //   }
        // } on FirebaseAuthException catch (e) {
        //   if (e.code == 'weak-password') {
        //     print('The password provided is too weak.');
        //   } else if (e.code == 'email-already-in-use') {
        //     print('The account already exists for that email.');
        //   }
        // } catch (e) {
        //   print(e);
        // }

// #### firebase sing up #### //
      }

// #### sign up #### //
    });
  }
}
