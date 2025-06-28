// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eloro_shop_uae/core/constants/app_constants.dart';
import 'package:eloro_shop_uae/core/themes/app_colors.dart';
import 'package:eloro_shop_uae/main.dart';
import 'package:eloro_shop_uae/view/shared/app_button.dart';
import 'package:eloro_shop_uae/view/shared/widgets/toast.dart';
import 'package:flutter/material.dart';
// this is just commit for updating the code snippet
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: const Text(
          "Products",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            AppConstants.emptySpaceFifteenPixl,
            AppConstants.emptySpaceFifteenPixl,
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.darkBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            AppConstants.emptySpaceFifteenPixl,
            AppConstants.emptySpaceFifteenPixl,
            Container(
              height: 200,
              decoration: BoxDecoration(
                // color: AppColors.darkBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Product details:\nThis is a sample product description that provides details about the product, including its features, specifications, and benefits. It is designed to give potential customers a clear understanding of what the product offers.",
                style: TextStyle(fontSize: 20, color: AppColors.mainColor),
              ),
            ),
            AppConstants.emptySpaceFifteenPixl,
            AppConstants.emptySpaceFifteenPixl,
            AppButton(
                title: "Add to Cart",
                backgroundColor: AppColors.mainColor,
                textColor: Colors.white,
                onTap: () {
                  customAppToast(message: "Product added to cart");
                }),
            AppConstants.emptySpaceFifteenPixl,
            AppConstants.emptySpaceFifteenPixl,
          ],
        ),
      ),
    );
  }
}
