part of 'home_bloc.dart';

// sealed class HomeState extends Equatable {
//   const HomeState();
  
//   @override
//   List<Object> get props => [];
// }

// final class HomeInitialState extends HomeState {}
// final class HomeLoadingState extends HomeState {}
// final class HomeSucssesState extends HomeState {}
// final class HomeErrorState extends HomeState {}

///
///
///

// States
// abstract class HomeState {}
// class HomeInitial extends HomeState {}
// class HomeLoading extends HomeState {}
// class HomeLoaded extends HomeState {
//   final List<OptionGroupListModel> optionGroupsListModel;
//   // final List<PossibilityModel> availableOptions;
//   // final Map<int, List<PossibilityModel>> availableOptions;
//   final List<AvailableOptionLisMoudel> availableOptions;
//   final Map<int, int> selectedOptions;
//   HomeLoaded({required this.optionGroupsListModel, required this.availableOptions, required this.selectedOptions});
// }
// class HomeError extends HomeState {
//   final String message;
//   HomeError(this.message);
// }
// class OptionSelectionUpdated extends HomeState {
//   final Map<int, int> selectedOptions;
//   OptionSelectionUpdated(this.selectedOptions);
// }



///
///
///


// States
abstract class HomeState {}
class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<OptionGroupsLiMoudel> optionGroups;
  final List<AvailableOptionLisMoudel> availableOptions;
  final Map<int, int> selectedOptions;
  HomeLoaded({required this.optionGroups, required this.availableOptions, required this.selectedOptions});
}
class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
class OptionSelectionUpdated extends HomeState {
  final Map<int, int> selectedOptions;
  OptionSelectionUpdated(this.selectedOptions);
}
