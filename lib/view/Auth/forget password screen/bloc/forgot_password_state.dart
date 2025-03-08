part of 'forgot_password_bloc.dart';

// sealed class ForgotPasswordState extends Equatable {
//   const ForgotPasswordState();
  
//   @override
//   List<Object> get props => [];
// }

// final class ForgotPasswordInitial extends ForgotPasswordState {}


abstract class ForgotPasswordState {}

class ForgotPasswordInitialState extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  final String message;

  ForgotPasswordSuccessState({required this.message});
}

class ForgotPasswordErrorState extends ForgotPasswordState {
  final String errorMessage;

  ForgotPasswordErrorState({required this.errorMessage});
}
