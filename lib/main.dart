import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhmart/Src/modules/onBroading/views/SplashScreen.dart';

void main(){
    runApp(
        ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
                return MaterialApp(
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: Colors.white
          ),
            debugShowCheckedModeBanner: false,
            home:SplashScreen() ,
        );
            }
        )
    );
}