import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/profile_hover_controller.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:provider/provider.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileHoverController>(
          create: (context) => ProfileHoverController(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
