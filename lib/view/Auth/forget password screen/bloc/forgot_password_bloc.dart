// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:special_line_vendors/core/helpers/dio_helper.dart';
// import 'package:special_line_vendors/core/helpers/user_expernce_helper.dart';
// import 'package:special_line_vendors/view/Auth/forget%20password%20screen/model/forgot_password_model.dart';

// part 'forgot_password_event.dart';
// part 'forgot_password_state.dart';

// // class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
// //   ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
// //     on<ForgotPasswordEvent>((event, emit) {
// //       // TODO: implement event handler
// //     });
// //   }
// // }

// // class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
// //   ForgotPasswordBloc() : super(ForgotPasswordInitialState());

// //   @override
// //   Stream<ForgotPasswordState> mapEventToState(ForgotPasswordEvent event) async* {

// //     // on<ForgotPasswordRequestEvent>((event, emit) {...})
// //     if (event is ForgotPasswordRequestEvent) {
// //       yield ForgotPasswordLoadingState();

// //       // Check for internet connectivity
// //       bool isConnected = await InternetConnectionChecker().hasConnection;
// //       if (!isConnected) {
// //         UserExperinceHelper()
// //             .showNetorkCheckerDialog(theContext: event.theContext);
// //         yield ForgotPasswordErrorState(errorMessage: "No Internet Connection");
// //         return;
// //       }

// //       try {
// //         // Send the forgot password request
// //         Response forgotPasswordResponse =
// //             await DioHelper.forgotPassword(email: event.email);
// // print("ffffffffffffffffffffffffffffffffffffff$forgotPasswordResponse");
// //         if (forgotPasswordResponse.statusCode == 200) {
// //           ForgotPasswordModel model =
// //               ForgotPasswordModel.fromJson(forgotPasswordResponse.data);

// //           if (model.code == 200) {
// //             yield ForgotPasswordSuccessState(message: model.message ?? "Success");
// //           } else {
// //             yield ForgotPasswordErrorState(
// //                 errorMessage: model.message ?? "Unexpected error");
// //           }
// //         } else {
// //           // Handle unexpected HTTP status codes
// //           yield ForgotPasswordErrorState(
// //             errorMessage: "Unexpected error: ${forgotPasswordResponse.statusCode}",
// //           );
// //         }
// //       } catch (e) {
// //         // Handle error response or exceptions
// //         if (e is DioException && e.response != null) {
// //           ForgotPasswordModel errorResponse =
// //               ForgotPasswordModel.fromJson(e.response!.data);

// //           yield ForgotPasswordErrorState(
// //             errorMessage: errorResponse.message ?? "Unknown error occurred",
// //           );
// //         } else {
// //           yield ForgotPasswordErrorState(
// //             errorMessage: "An error occurred: ${e.toString()}",
// //           );
// //         }
// //       }
// //     }
// //   }
// // }

// class ForgotPasswordBloc
//     extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
//   ForgotPasswordBloc() : super(ForgotPasswordInitialState()) {
//     // Register the event handler for ForgotPasswordRequestEvent
//     on<ForgotPasswordRequestEvent>(_onForgotPasswordRequestEvent);
//   }

//   // Handler for ForgotPasswordRequestEvent
//   Future<void> _onForgotPasswordRequestEvent(ForgotPasswordRequestEvent event,
//       Emitter<ForgotPasswordState> emit) async {
//     emit(ForgotPasswordLoadingState());

//     // Check for internet connectivity
//     bool isConnected = await InternetConnectionChecker().hasConnection;
//     if (!isConnected) {
//       UserExperinceHelper()
//           .showNetorkCheckerDialog(theContext: event.theContext);
//       emit(ForgotPasswordErrorState(errorMessage: "No Internet Connection"));
//       return;
//     }

//     try {
//       // Send the forgot password request
//       Response forgotPasswordResponse =
//           await DioHelper.forgotPassword(email: event.email);
//       print("ffffffffffffffffffffffffffffffffffffff$forgotPasswordResponse");

//       if (forgotPasswordResponse.statusCode == 200) {
//         ForgotPasswordModel model =
//             ForgotPasswordModel.fromJson(forgotPasswordResponse.data);

//         if (model.code == 200) {
//           emit(ForgotPasswordSuccessState(message: model.message ?? "Success"));
//         } else {
//           emit(ForgotPasswordErrorState(
//               errorMessage: model.message ?? "Unexpected error"));
//         }
//       } else {
//         // Handle unexpected HTTP status codes
//         emit(ForgotPasswordErrorState(
//           errorMessage:
//               "Unexpected error: ${forgotPasswordResponse.statusCode}",
//         ));
//       }
//     } catch (e) {
//       // Handle error response or exceptions
//       if (e is DioException && e.response != null) {
//         ForgotPasswordModel errorResponse =
//             ForgotPasswordModel.fromJson(e.response!.data);

//         emit(ForgotPasswordErrorState(
//           errorMessage: errorResponse.message ?? "Unknown error occurred",
//         ));
//       } else {
//         emit(ForgotPasswordErrorState(
//           errorMessage: "An error occurred: ${e.toString()}",
//         ));
//       }
//     }
//   }
// }
