import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:store_app/const/app_const.dart';
import 'package:store_app/models/products.dart';

import '../../models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> categories = [
    CategoryModel(categoryId: 'electronics', categoryTitle: 'Electronics'),
    CategoryModel(categoryId: 'jewelery', categoryTitle: 'Jewelery'),
    CategoryModel(
        categoryId: "men's clothing", categoryTitle: "Men's Clothing"),
    CategoryModel(
        categoryId: "women's clothing", categoryTitle: "Women's Clothing"),
  ];

  int initialIndex = 0;

  void changeCategoryIndex(int newIndex) {
    initialIndex = newIndex;
    emit(CategoryItemChangeIndexState());
  }

  List<Products> products = [];

  void getProductsByCategory({required String categoryId}) {
    try {
      emit(CategoryItemLoadingState());
      Uri url = Uri.https(BASEURL, '$productsByCategory$categoryId');
      http.get(url).then(
        (value) {
          var json = jsonDecode(value.body);
          products =
              (json as List).map((e) => Products.fromJson(e)).toList();
          emit(CategoryItemSuccessState());
        },
      );
    } catch (error) {
      emit(
        CategoryItemFailureState(
          error: error.toString(),
        ),
      );
    }
  }
}
