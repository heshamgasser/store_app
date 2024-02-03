part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenGetProductsLoadingState extends HomeScreenState {}

class HomeScreenGetProductsSuccessState extends HomeScreenState {}

class HomeScreenGetProductsFailureState extends HomeScreenState {
  String error;

  HomeScreenGetProductsFailureState({required this.error});
}
