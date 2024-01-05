part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeFetchData extends HomeEvent {
  final List<int> count;
  HomeFetchData({required this.count});
}
