import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhmart/Src/const/AppImages.dart';
import 'package:mhmart/Src/modules/HomeScreen/HomePage.dart';
import 'package:mhmart/Src/modules/onBroading/views/OnBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;
  @override
 
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if(_auth.currentUser == null){
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
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