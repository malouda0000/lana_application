part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLogInEvent extends AuthEvent {
  final BuildContext theContext;
  AuthLogInEvent({required this.theContext});
}
final class AuthSignupEvet extends AuthEvent {
  final BuildContext theContext;
  AuthSignupEvet({required this.theContext});
}

final class AuthSignInWithGoogeleEvent extends AuthEvent {
  
  final BuildContext theContext;
  AuthSignInWithGoogeleEvent({required this.theContext});
}
class SignOutEvent extends AuthEvent {}
