import 'package:eloro_shop_uae/core/constants/app_constants.dart';
import 'package:eloro_shop_uae/core/func/hash_color_converter.dart';
import 'package:eloro_shop_uae/view/home/bloc/home_bloc/home_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: const Text(
          "Eloro Shop UAE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              final colorGroup = state.optionGroups.firstWhere(
                (group) => group.isColor == true,
                orElse: () => state.optionGroups.first,
              );
              final sizeGroup = state.optionGroups.firstWhere(
                (group) => group.isColor == false,
                orElse: () => state.optionGroups.last,
              );

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Color Selection
                    Text(
                      colorGroup.optionGroupNameEn ?? "Colors",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.theDefBaddingFifteenPixl,
                        vertical: AppConstants.theDefBaddingFifteenPixl,
                      ),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: colorGroup.options!.map((option) {
                          return InkWell(
                            onTap: () {
                              context.read<HomeBloc>().add(SelectOption(
                                    groupId: colorGroup.optionGroupId!,
                                    optionId: option.optionId!,
                                  ));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    AppConstants.theNewBorderRadiusTenPX,
                                color: hexToColor(option.colorHash),
                                // border: Border.all(
                                //   color: AppColors.greyColor,
                                // ),
                              ),
                              child: Column(
                                children: [
                                  Radio<int>(
                                    value: option.optionId!,
                                    groupValue: state.selectedOptions[
                                        colorGroup.optionGroupId],
                                    onChanged: (value) {
                                      context.read<HomeBloc>().add(SelectOption(
                                            groupId: colorGroup.optionGroupId!,
                                            optionId: option.optionId!,
                                          ));
                                    },
                                    activeColor: AppColors.mainColor,
                                  ),
                                  Text(option.nameEn ?? "Option"),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 16.0),

                    // Size Selection (Updated dynamically based on color selection)
                    Text(
                      sizeGroup.optionGroupNameEn ?? "Sizes",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.theDefBaddingFifteenPixl,
                        vertical: AppConstants.theDefBaddingFifteenPixl,
                      ),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: sizeGroup.options!.map((option) {
                          final isEnabled = state.filteredAvailableOptions.any(
                              (pg) =>
                                  pg.optionGroupId == sizeGroup.optionGroupId &&
                                  pg.optionId == option.optionId);
                          return InkWell(
                            onTap: () {
                              if (isEnabled) {
                                context.read<HomeBloc>().add(SelectOption(
                                      groupId: sizeGroup.optionGroupId,
                                      optionId: option.optionId,
                                    ));
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    AppConstants.theNewBorderRadiusTenPX,
                                boxShadow: AppConstants.theBoxShdow,
                                color: Theme.of(context).cardColor,
                                // border: Border.all(
                                //   color:   AppColors.greyColor,
                                // ),
                              ),
                              child: Column(
                                children: [
                                  Radio<int>(
                                    value: option.optionId,
                                    groupValue: state.selectedOptions[
                                        sizeGroup.optionGroupId],
                                    onChanged: isEnabled
                                        ? (value) {
                                            context
                                                .read<HomeBloc>()
                                                .add(SelectOption(
                                                  groupId:
                                                      sizeGroup.optionGroupId!,
                                                  optionId: option.optionId!,
                                                ));
                                          }
                                        : null,
                                    activeColor: AppColors.mainColor,
                                  ),
                                  Text(option.nameEn ?? "Option"),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("No data available"));
          },
        ),
      ),
    );
  }
}
