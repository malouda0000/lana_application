part of 'home_bloc.dart';
abstract class HomeState {}
class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<OptionGroupsLi> optionGroups;
  final List<AvailableOptionLis> availableOptions;
  final Map<int, int> selectedOptions;
  final List<PossibilityGroup> filteredAvailableOptions;
  final Color? theMainColor;

  HomeLoaded({
    required this.optionGroups,
    required this.availableOptions,
    required this.selectedOptions,
    this.filteredAvailableOptions = const [],
    required this.theMainColor,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
class OptionSelectionUpdated extends HomeState {
  final Map<int, int> selectedOptions;
  OptionSelectionUpdated(this.selectedOptions);
}
