import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhmart/Src/modules/onBroading/views/SplashScreen.dart';
import 'package:mhmart/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScreenUtilInit(
    designSize: Size(384, 805),
    minTextAdapt: true,
    builder: (context, child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            
            fontFamily: 'Poppins',
          ),
          home: SplashScreen());
    },
  ));
}
