import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:eloro_shop_uae/core/helpers/dio_helper.dart';
import 'package:eloro_shop_uae/view/home/model/opetion_group_moudel.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';
// Bloc
// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   HomeBloc() : super(HomeInitial()) {
//     on<FetchOptions>(_onFetchOptions);
//     // on<SelectOption>(_onSelectOption);
//   }

//   Future<void> _onFetchOptions(FetchOptions event, Emitter<HomeState> emit) async {
//     emit(HomeLoading());
//     try {
//       final response = await DioHelper.fetchOptions();
//       if (response.statusCode == 200) {
//         final data = response.data;
//         OptionGroupListModel optionGroups = OptionGroupListModel.fromJson(data);
//         final availableOptions = optionGroups.data!.availableOptionLis!;
//         emit(HomeLoaded(optionGroupsListModel: [optionGroups], availableOptions: availableOptions, selectedOptions: {}));
//       } else {
//         emit(HomeError("Failed to fetch data: ${response.statusMessage}"));
//       }
//     } catch (e) {
//       emit(HomeError("An error occurred: $e"));
//     }
//   }
//   // void _onSelectOption(SelectOption event, Emitter<HomeState> emit) {
//   //   if (state is HomeLoaded) {
//   //     final currentState = state as HomeLoaded;
//   //     final newSelectedOptions = Map<int, int>.from(currentState.selectedOptions);
//   //     newSelectedOptions[event.groupId] = event.optionId;
//   //     emit(OptionSelectionUpdated(newSelectedOptions));
//   //     emit(HomeLoaded(
//   //       optionGroups: currentState.optionGroups,
//   //       availableOptions: currentState.availableOptions,
//   //       selectedOptions: newSelectedOptions,
//   //     ));
//   //   }
//   // }
// }

/////////
///
///
///

// Bloc
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // final Dio _dio = Dio(
  //   BaseOptions(
  //     // baseUrl: "https://dashboard.eloroshop.com/eloroshopAppApi/v1/api/",
  //     connectTimeout: Duration(seconds: 10),
  //     receiveTimeout: Duration(seconds: 10),

  //   ),

  // );
  final String apiUrl =
      "https://dashboard.eloroshop.com/eloroshopAppApi/v1/api/OptionGroups/Multi?productId=61";

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  )
    ..httpClientAdapter = DefaultHttpClientAdapter()
    ..httpClientAdapter = DefaultHttpClientAdapter()
    ..httpClientAdapter = (DefaultHttpClientAdapter()
      ..onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      });
  HomeBloc() : super(HomeInitial()) {
    on<FetchOptions>(_onFetchOptions);
    on<SelectOption>(_onSelectOption);
  }

  Future<void> _onFetchOptions(
      FetchOptions event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final response = await _dio.get(apiUrl);
      if (response.statusCode == 200) {
        // print("==========" + response.data.toString());
        // print("==========v ressponse 200");
        final data = response.data;
        final optionGroups =
            OptionGroupListModel.fromJson(data);
        print("==========" + optionGroups.toString());
        final availableOptions =
            AvailableOptionLis.fromJson(data['data']['availableOptionLis']);
        emit(HomeLoaded(
            optionGroups: optionGroups.data!.optionGroupsLis,
            availableOptions: [availableOptions],
            selectedOptions: {})
            );

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
      emit(OptionSelectionUpdated(newSelectedOptions));
      emit(HomeLoaded(
        optionGroups: currentState.optionGroups,
        availableOptions: currentState.availableOptions,
        selectedOptions: newSelectedOptions,
      ));
    }
  }
}
