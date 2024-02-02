import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/home_layout_cubit/home_layout_cubit.dart';
import 'package:store_app/cubits/home_layout_cubit/home_layout_state.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'Home Layout';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // var homeBloc =
          //     BlocProvider.of<HomeLayoutCubit>(context, listen: true);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'New Trend',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: HomeLayoutCubit.get(context).selectedIndex,
              onTap: (value) {
                //   add changeIndex Function
                HomeLayoutCubit.get(context).changeIndex(indexValue: value);
                log(value.toString());
                log(HomeLayoutCubit.get(context).selectedIndex.toString());
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
            body: HomeLayoutCubit.get(context).tabs[HomeLayoutCubit.get(context).selectedIndex],
          );
        },
      ),
    );
  }
}
