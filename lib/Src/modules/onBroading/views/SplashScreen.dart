import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhmart/Src/const/AppImages.dart';
import 'package:mhmart/Src/modules/onBroading/views/OnBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 300.h,
            left: 0.w,
            right: 0.w,
            child: 
          Image.asset(AppImages.logo),),
          Positioned(
          
            left: 145.w,
            right: 0.w,
            bottom: 0.h,
            child: Image.asset(AppImages.illustion))
        ],
      )
    );
  }
}