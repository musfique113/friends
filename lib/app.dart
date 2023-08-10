import 'package:flutter/material.dart';
import 'package:friends/presentation/home_screen.dart';

class FriendsApp extends StatelessWidget {
  const FriendsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        )
    );
  }
}
