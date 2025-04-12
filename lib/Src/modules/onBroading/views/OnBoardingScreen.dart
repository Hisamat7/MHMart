import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhmart/Src/const/AppButton.dart';
import 'package:mhmart/Src/const/AppImages.dart';
import 'package:mhmart/Src/modules/onBroading/views/OnBoardingScreenTwo.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300.h,
            child: Center(child: Image.asset(AppImages.onBoradingImage)),
          ),
        
          Text(
            "All Your Favorites",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              height: 2,
            ),
          ),
          Text(
            "Get all your favorite foods in one place\nyou just place the order we do the rest",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 90.h,),
          AppButton(
            text: "Next",
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreenTwo()));
            },
          ),
          SizedBox(height: 20.h,),
          Text("Skip",style: TextStyle(color: Colors.grey[600],fontSize: 16.sp),)
        ],
      ),
    );
  }
}
