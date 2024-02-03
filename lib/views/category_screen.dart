import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/cubits/category_cubit/category_cubit.dart';
import 'package:store_app/views/widgets/bottom_appBar.dart';
import 'package:store_app/views/widgets/helper_snackBar.dart';
import 'package:store_app/views/widgets/item_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is CategoryItemLoadingState) {
            Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryItemFailureState) {
            helperSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return BottomAppBarWidget(
                          categoryModel:
                              CategoryCubit.get(context).categories[index],
                          selectedColor:
                              CategoryCubit.get(context).initialIndex == index
                                  ? Colors.cyanAccent
                                  : Colors.blueAccent,
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10.w);
                      },
                      itemCount: CategoryCubit.get(context).categories.length),
                ),
                SizedBox(height: 20.h),
                (state is CategoryItemSuccessState)
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 10.w,
                            mainAxisExtent: 260.r,
                          ),
                          itemBuilder: (context, index) {
                            return ItemWidget(
                              product:
                                  CategoryCubit.get(context).products[index],
                            );
                          },
                          itemCount: CategoryCubit.get(context).products.length,
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
