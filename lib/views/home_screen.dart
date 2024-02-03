import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:store_app/views/widgets/helper_snackBar.dart';
import 'package:store_app/views/widgets/item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()..getProducts(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is HomeScreenGetProductsLoadingState) {
            Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeScreenGetProductsFailureState) {
            helperSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          return (state is HomeScreenGetProductsSuccessState)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                    mainAxisExtent: 260.r,
                  ),
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      product: HomeScreenCubit.get(context).products[index],
                    );
                  },
                  itemCount: HomeScreenCubit.get(context).products.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
