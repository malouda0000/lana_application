// theme_event.dart
import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  
  @override
  List<Object> get props => [];
}

class LoadThemeEvent extends ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}
