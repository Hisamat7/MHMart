import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhmart/Src/const/AppButton.dart';
import 'package:mhmart/Src/const/AppImages.dart';
import 'package:mhmart/Src/modules/auth_module/views/SignUp.dart';

class OnboardingScreenTwo extends StatefulWidget {
  const OnboardingScreenTwo({super.key});

  @override
  State<OnboardingScreenTwo> createState() => _OnboardingScreenTwoState();
}

class _OnboardingScreenTwoState extends State<OnboardingScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300.h,
            child: Center(child: Image.asset(AppImages.onBoradingImageTwo)),
          ),
        
          Text(
            "order From Choosen Chef",
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
            },
          ),
          SizedBox(height: 20.h,),
          Text("Skip",style: TextStyle(color: Colors.grey[600],fontSize: 16.sp),)
        ],
      ),
    );
  }
}