import 'package:flutter/material.dart';
import 'package:friends/view/home_screen.dart';
import 'package:get/get.dart';

class FriendsApp extends StatelessWidget {
  const FriendsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Friends App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          fontFamily: "Poppins",
        ),
        home: OrientationBuilder(
          builder: (context, orientation) {
            return HomeScreen(orientation: orientation);
          },
        ));
  }
}
