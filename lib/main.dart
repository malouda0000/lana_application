import 'dart:io';

import 'package:eloro_shop_uae/core/func/theme_repositores.dart';
import 'package:eloro_shop_uae/core/helpers/cache_helper.dart';
import 'package:eloro_shop_uae/core/helpers/dio_helper.dart';
import 'package:eloro_shop_uae/core/themes/app_colors.dart';
import 'package:eloro_shop_uae/view/Auth/bloc/auth_bloc.dart';
import 'package:eloro_shop_uae/view/Auth/login/login_screen.dart';
import 'package:eloro_shop_uae/view/home/bloc/home_bloc/home_bloc.dart';
import 'package:eloro_shop_uae/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String? globalCachedUserToken = "";
String? globalCachedTEMPUserToken =
    "842|kfJ1xYx8xejTn9Oz9YNWRZUsx46l13v09X60PKhk29dc2055";
String? globalCachedUserLang;
String? globalCachedArabicUserName;
String? globalCachedEnglishUserName;
String? globalCachedUserImage = "";
String? globalCachedNationaltyID;
String? globalCachedNationaltyAr;
String? globalCachedNationaltyEn;
String? globalCachedUserBirthdate;
int? globalCachedUserGender;

String? globalCachedUserID;
String? globalCachedUserPhoneNum;
String? globalCachedUserEmail;
String? globalCachedUserImageUserDoesntExiset =
    "https://thispersondoesnotexist.com/";
const String globalDefaltCachedNetworkImage =
    "https://www.istockphoto.com/illustrations/green-shopping-cart-icon";
// const String globalDefaltCachedNetworkImage =
//     "https://cdn4.iconfinder.com/data/icons/social-media-2070/140/_shopify-512.png";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.mainColor,

    statusBarIconBrightness: Brightness.dark, // Set icons to black
    statusBarBrightness: Brightness.light, // Adjust for iOS
  )); // Set the status bar color
  final ThemeRepository themeRepository = ThemeRepository();

  await CacheHelper.init();
  await DioHelper.init();
  // await Hive.initFlutter();

  runApp(MyApp(themeRepository: themeRepository));
}

class MyApp extends StatelessWidget {
  final ThemeRepository themeRepository;
  const MyApp({super.key, required this.themeRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        // BlocProvider<LocalizationBloc>(create: (context) => LocalizationBloc()),
      ],
      child: MaterialApp(
        title: 'LANA Life Care',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: globalCachedUserToken != null && globalCachedUserToken != ""
            ? const HomeScreen()
            : const LogInScreen(),
      ),
    );
  }
}
