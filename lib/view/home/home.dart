import 'package:eloro_shop_uae/core/constants/app_constants.dart';
import 'package:eloro_shop_uae/core/func/hash_color_converter.dart';
import 'package:eloro_shop_uae/core/func/nav_func.dart';
import 'package:eloro_shop_uae/core/helpers/cache_helper.dart';
import 'package:eloro_shop_uae/core/helpers/user_expernce_helper.dart';
import 'package:eloro_shop_uae/view/Auth/login/login_screen.dart';
import 'package:eloro_shop_uae/view/home/bloc/home_bloc/home_bloc.dart';
import 'package:eloro_shop_uae/view/home/order/order_screen.dart';
import 'package:eloro_shop_uae/view/home/show_order/show_order_screen.dart';
import 'package:eloro_shop_uae/view/shared/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eloro_shop_uae/core/themes/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchOptions());
  }

  List<Widget> screens = [
    OrderScreen(),
    ShowOrderesScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: const Text(
          "Lana Care UAE",
          style: TextStyle(
            // color: AppColors.darkBgColor,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await UserExperinceHelper().showCustomDialog(
                    theContext: context,
                    // dialogContent: AppLocalizations.of(context)!.userAgrement,
                    dialogContent: "sign out",
                    confirmButtonTitle: "ok",
                    onConfirm: () async {
                      await FirebaseAuth.instance.signOut();
                      await CacheHelper.removeAllSecureData();
                      navigateToWithReplacement(context, LogInScreen());

                      customAppToast(message: "sign out sucessfully");
                    });
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        // child: BlocBuilder<HomeBloc, HomeState>(
        //   builder: (context, state) {
        //     if (state is HomeLoading) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (state is HomeLoaded) {
        //       final optionsGroupName = state.optionGroups.firstWhere(
        //         (group) => group.isColor == true,
        //         orElse: () => state.optionGroups.first,
        //       );
        //       final sizeGroup = state.optionGroups.firstWhere(
        //         (group) => group.isColor == false,
        //         orElse: () => state.optionGroups.last,
        //       );

        //       return Padding(
        //         padding: const EdgeInsets.all(16.0),
        //         child: screens[_currentIndex],
        //       );
        //     } else if (state is HomeError) {
        //       return Center(child: Text(state.message));
        //     }
        //     return const Center(child: Text("No data available"));
        //   },
        // ),

        child: screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => setState(() {
                _currentIndex = value;
              }),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "list"),
          ]),
    );
  }
}
