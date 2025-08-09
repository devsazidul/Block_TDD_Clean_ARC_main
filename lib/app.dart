import 'package:bloc_tdd_arc/core/services/router/app_routes.dart';
import 'package:bloc_tdd_arc/core/services/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseOnline extends StatelessWidget {
  const CourseOnline({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
// Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.getLoginScreen(),
          onGenerateRoute: generateRoute,
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}