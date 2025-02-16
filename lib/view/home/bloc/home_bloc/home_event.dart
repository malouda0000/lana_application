part of 'home_bloc.dart';
// Events
abstract class HomeEvent {}
class FetchOptions extends HomeEvent {}
class SelectOption extends HomeEvent {
  final int groupId;
  final int optionId;
  final String? colorHash;
  SelectOption({required this.groupId, required this.optionId, 
  this.colorHash
  });
}
