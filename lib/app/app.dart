import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:listaactividades/app/view/splash/splash_page.dart';

//import 'package:listaactividades/view/home.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF40B7AD);
    const colorText = Color(0xFF4A4A4A);
    const backGraund = Color(0xFFF5F5F5);
    return GetMaterialApp(
      title: 'Lista Activodades',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: backGraund,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Poppins',
          bodyColor: colorText,
          displayColor: colorText,
        )
      ),
      home: const SplashPage(),
    );
  }
}