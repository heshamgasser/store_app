part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitialState extends CategoryState {


}

class CategoryItemChangeIndexState extends CategoryState {}

class CategoryItemLoadingState extends CategoryState {}

class CategoryItemSuccessState extends CategoryState {}

class CategoryItemFailureState extends CategoryState {
  String error;

  CategoryItemFailureState({required this.error});
}
