// import 'package:eloro_shop_uae/view/home/bloc/home_bloc/home_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:eloro_shop_uae/core/themes/app_colors.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<HomeBloc>().add(FetchOptions());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.mainColor,
//         centerTitle: true,
//         title: const Text(
//           "Eloro Shop UAE",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: BlocBuilder<HomeBloc, HomeState>(
//           builder: (context, state) {
//             if (state is HomeLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is HomeLoaded) {
//               return ListView.builder(
//                 padding: const EdgeInsets.all(16.0),

//                 itemCount: state.optionGroups.length,
//                 itemBuilder: (context, index) {

//                   final group = state.optionGroups[index];
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         group.optionGroupNameEn ?? "Unknown",
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Wrap(
//                         spacing: 8.0,
//                         children: group.options!.map((option) {
//                           final isEnabled = state.availableOptions.any((available) =>
//                               available.possibilities!.any((p) =>
//                                   p.possibilityGroups!.any((pg) =>
//                                       pg.optionGroupId == group.optionGroupId &&
//                                       pg.optionId == option.optionId)));
//                           return ChoiceChip(
//                             label: Text(option.nameEn ?? "Option"),
//                             selected: state.selectedOptions[group.optionGroupId] == option.optionId,
//                             onSelected: isEnabled
//                                 ? (_) => context.read<HomeBloc>().add(
//                                       SelectOption(groupId: group.optionGroupId!, optionId: option.optionId!),
//                                     )
//                                 : null,
//                           );
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 16.0),
//                     ],
//                   );
//                 },
//               );
//             } else if (state is HomeError) {
//               return Center(child: Text(state.message));
//             }
//             return const Center(child: Text("No data available"));
//           },
//         ),
//       ),
//     );
//   }}

///
///
///
///
///
///
///

// #### new home screen #### //
// import 'package:eloro_shop_uae/view/home/bloc/home_bloc/home_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:eloro_shop_uae/core/themes/app_colors.dart';
// import 'package:flutter_animate/flutter_animate.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<HomeBloc>().add(FetchOptions());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.mainColor,
//         centerTitle: true,
//         title: const Text(
//           "Eloro Shop UAE",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: BlocBuilder<HomeBloc, HomeState>(
//           builder: (context, state) {
//             if (state is HomeLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is HomeLoaded) {
//               return ListView.builder(
//                 padding: const EdgeInsets.all(16.0),
//                 itemCount: state.optionGroups.length,
//                 itemBuilder: (context, index) {
//                   final group = state.optionGroups[index];
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         group.optionGroupNameEn ?? "Unknown",
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ).animate().fadeIn(duration: 500.ms),
//                       Column(
//                         children: group.options!.map((option) {
//                           final isEnabled = state.availableOptions.any((available) =>
//                               available.possibilities!.any((p) =>
//                                   p.possibilityGroups!.any((pg) =>
//                                       pg.optionGroupId == group.optionGroupId &&
//                                       pg.optionId == option.optionId)));
//                           return RadioListTile<int>(
//                             title: Text(option.nameEn ?? "Option"),
//                             value: option.optionId!,
//                             groupValue: state.selectedOptions[group.optionGroupId],
//                             onChanged: isEnabled
//                                 ? (value) => context.read<HomeBloc>().add(
//                                       SelectOption(groupId: group.optionGroupId!, optionId: option.optionId!),
//                                     )
//                                 : null,
//                             activeColor: AppColors.mainColor,
//                           ).animate().slide(duration: 400.ms);
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 16.0),
//                     ],
//                   );
//                 },
//               );
//             } else if (state is HomeError) {
//               return Center(child: Text(state.message));
//             }
//             return const Center(child: Text("No data available"));
//           },
//         ),
//       ),
//     );
//   }
// }

///
///
///
///
///
///
///
///
///

// ####  home screen 3333 #### //

import 'package:eloro_shop_uae/view/home/bloc/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eloro_shop_uae/core/themes/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: state.optionGroups.length,
                itemBuilder: (context, index) {
                  final group = state.optionGroups[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.optionGroupNameEn ?? "Unknown",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().fadeIn(duration: 500.ms),
                      Column(
                        children: group.options!.map((option) {
                          final isEnabled = state.availableOptions.any(
                              (available) => available.possibilities!.any((p) =>
                                  p.possibilityGroups!.any((pg) =>
                                      pg.optionGroupId == group.optionGroupId &&
                                      pg.optionId == option.optionId)));
                          return RadioListTile<int>(
                            title: Text(option.nameEn ?? "Option"),
                            value: option.optionId!,
                            groupValue:
                                state.selectedOptions[group.optionGroupId],
                            onChanged: isEnabled
                                ? (value) {
                                    context.read<HomeBloc>().add(
                                          SelectOption(
                                            groupId: group.optionGroupId!,
                                            optionId: option.optionId!,
                                          ),
                                        );
                                  }
                                : null,
                            activeColor: AppColors.mainColor,
                          )
                              .animate()
                              .slide(duration: 400.ms, begin: Offset(0, 0.5));
                        }).toList(),
                      ).animate().fadeIn(duration: 300.ms),
                      const SizedBox(height: 16.0),
                    ],
                  ).animate().fadeIn(duration: 600.ms).slide(duration: 600.ms);
                },
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
