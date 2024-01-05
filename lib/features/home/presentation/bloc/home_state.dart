part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<int> count;
  final List<Entries> entries;
  HomeSuccess({required this.entries, required this.count});
}

class HomeError extends HomeState {
  final String errorMsg;
  HomeError({required this.errorMsg});
}
