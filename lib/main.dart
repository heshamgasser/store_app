import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/bloc_observer/bloc_observer.dart';
import 'package:store_app/layout/home_layout.dart';
import 'package:store_app/styles/app_theme.dart';

void main (){
  Bloc.observer = MyBlocObserver();
  runApp(StoreApp());

}


class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeLayout.routeName,
          routes: {
            HomeLayout.routeName:(context) => HomeLayout(),

          },
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,

        );
      },

    );
  }
}
