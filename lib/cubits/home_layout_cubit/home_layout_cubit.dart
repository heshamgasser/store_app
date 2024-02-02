import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/cubits/home_layout_cubit/home_layout_state.dart';
import 'package:store_app/views/home_screen.dart';
import '../../views/cart_screen.dart';
import '../../views/favorites_screen.dart';
import '../../views/profile_screen.dart';
import '../../views/search_screen.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());

  static HomeLayoutCubit get(context) => HomeLayoutCubit();


  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];



  void changeIndex({required int indexValue}) {
    selectedIndex = indexValue;
    emit(
      HomeLayoutChangeIndexState(index: indexValue),
    );
  }
}
