import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:eloro_shop_uae/core/func/hash_color_converter.dart';
import 'package:eloro_shop_uae/core/helpers/dio_helper.dart';
import 'package:eloro_shop_uae/view/home/model/opetion_group_moudel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Color theMainColor = Colors.white;
  // final Dio _dio = Dio(
  //   BaseOptions(
  //     // baseUrl: "https://dashboard.eloroshop.com/eloroshopAppApi/v1/api/",
  //     connectTimeout: Duration(seconds: 10),
  //     receiveTimeout: Duration(seconds: 10),

  //   ),

  // );
  // final String apiUrl =
  //     "https://dashboard.eloroshop.com/eloroshopAppApi/v1/api/OptionGroups/Multi?productId=61";

  // final Dio _dio = Dio(
  //   // BaseOptions(
  //   //   connectTimeout: Duration(seconds: 10),
  //   //   receiveTimeout: Duration(seconds: 10),
  //   // ),
  // )
  //   ..httpClientAdapter = DefaultHttpClientAdapter()
  //   ..httpClientAdapter = DefaultHttpClientAdapter()
  //   ..httpClientAdapter = (DefaultHttpClientAdapter()
  //     ..onHttpClientCreate = (HttpClient client) {
  //       client.badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //       return client;
  //     }

  //     );
  HomeBloc() : super(HomeInitial()) {
    on<FetchOptions>(_onFetchOptions);
    on<SelectOption>(_onSelectOption);
  }

  Future<void> _onFetchOptions(
      FetchOptions event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      // final response = await _dio.get(apiUrl);
      final response = await DioHelper.fetchOptions();
      if (response.statusCode == 200) {
        // print("==========" + response.data.toString());
        // print("==========v ressponse 200");
        final data = response.data;
        final optionGroups = OptionGroupModel.fromJson(data);
        final availableOptions =
            AvailableOptionLis.fromJson(data['data']['availableOptionLis']);
        emit(HomeLoaded(
          optionGroups: optionGroups.data!.optionGroupsLis,
          availableOptions: [availableOptions],
          selectedOptions: {},
          theMainColor: theMainColor,
        ));

        // emit(HomeLoaded(optionGroupsListModel: [optionGroups], availableOptions: optionGroups.data!.availableOptionLis ?? [], selectedOptions: {}));
      } else {
        emit(HomeError("Failed to fetch data: ${response.statusMessage}"));
      }
    } catch (e) {
      emit(HomeError("An error occurred: $e"));
    }
  }

  void _onSelectOption(SelectOption event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final newSelectedOptions =
          Map<int, int>.from(currentState.selectedOptions);
      newSelectedOptions[event.groupId] = event.optionId;
      event.colorHash != null
          ? theMainColor = hexToColor(event.colorHash!)
          : null;

      List<PossibilityGroup> filteredAvailableOptions =
          currentState.filteredAvailableOptions;

      // If the user selects a color, filter available sizes
      final isColorSelected = currentState.optionGroups
          .firstWhere((group) => group.optionGroupId == event.groupId)
          .isColor;

      if (isColorSelected) {
        // Filter available sizes based on the selected color
        // if (event.colorHash != null) {
        //   print("-------------" + event.colorHash.toString());
        //   // theMainColor = hexToColor(event.colorHash!);
        // } else {
        //   print("-------++++++++------");
        // }
        filteredAvailableOptions = currentState.availableOptions
            .expand((available) => available.possibilities!)
            .where((possibility) => possibility.possibilityGroups!.any((pg) =>
                pg.optionGroupId == event.groupId &&
                pg.optionId == event.optionId))
            .expand((possibility) => possibility.possibilityGroups!)
            .where((pg) => pg.optionGroupId != event.groupId)
            .toList();

        // Reset the selected size when changing color
        final sizeGroup = currentState.optionGroups.firstWhere(
            (g) => !g.isColor,
            orElse: () => currentState.optionGroups.last);
        newSelectedOptions.remove(sizeGroup.optionGroupId);
      }

      emit(HomeLoaded(
        optionGroups: currentState.optionGroups,
        availableOptions: currentState.availableOptions,
        selectedOptions: newSelectedOptions,
        filteredAvailableOptions:
            filteredAvailableOptions, //  Update available sizes dynamically

        theMainColor: theMainColor,
      ));
    }
  }
}
