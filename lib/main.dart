import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/services/services_loactor.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/screen/splach_screen.dart';

void main() async {
  await servicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(389.989990234375, 928),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: SplachScreen(),
      ),
    );
  }
}
