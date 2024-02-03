import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import '../../const/app_const.dart';
import '../../models/products.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  List<Products> products = [];

  Future<void> getProducts() async {
    emit(HomeScreenGetProductsLoadingState());
    try {
      Uri url = Uri.https(BASEURL, productEndPoint);
      http.get(url).then(
        (value) {
          var json = jsonDecode(value.body);
          products = (json as List).map((e) => Products.fromJson(e)).toList();
          emit(HomeScreenGetProductsSuccessState());
        },
      );
    } catch (error) {
      emit(HomeScreenGetProductsFailureState(error: error.toString()));
    }
  }
}
