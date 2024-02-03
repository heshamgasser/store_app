import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/models/category_model.dart';

import '../../cubits/category_cubit/category_cubit.dart';

class BottomAppBarWidget extends StatelessWidget {
  CategoryModel categoryModel;
  Color selectedColor;
  int index;

  BottomAppBarWidget(
      {required this.categoryModel,
      required this.selectedColor,
      required this.index});

  @override
  Widget build(BuildContext context) {



    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        //   add change Index Function
        CategoryCubit.get(context).changeCategoryIndex(index);
        CategoryCubit.get(context)
            .getProductsByCategory(categoryId: categoryModel.categoryId);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: BottomAppBar(
          color: selectedColor,
          height: 60.h,
          child: Text(
            categoryModel.categoryTitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
