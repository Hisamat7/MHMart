import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhmart/Src/const/AppButton.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
  Widget textWidget(String text) {
    return  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                    );
  }
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 210,
              width: double.infinity,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Sign in",
                      style:
                          TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  Text(
                      "Sign in to continue",
                      style:
                          TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal,color: Colors.white),
                    ),
                ],
              ),
              
            ),
          ),
          // Main container
          Positioned(
            top:
                190, // Adjust this value to position the container below the "Sign in" text
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
               child: Column(
                 children: [
                  SizedBox(height: 30.h),
                   textWidget("Name"),
                  SizedBox(height: 15.h),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor:const Color.fromARGB(255, 240, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Enter your name",
                    ),
                  ),
                  SizedBox(height: 20.h),
                  textWidget("Email"),
                  SizedBox(height: 15.h),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor:const Color.fromARGB(255, 240, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Enter your email",
                    ),
                  ),
                  SizedBox(height: 20.h),
                  textWidget("Password"),
                  SizedBox(height: 15.h),
                  TextFormField(
                    obscureText: !passwordVisible,
                    obscuringCharacter: "*",
                    
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                      fillColor: const Color.fromARGB(255, 240, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Enter password",
                    ),
                  ),
                  SizedBox(height: 20.h),
                  textWidget("Confirm Password"),
                  SizedBox(height: 15.h),
                  TextFormField(
                      obscureText: !passwordVisible,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                      fillColor: const Color.fromARGB(255, 240, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Re Enter password",
                    ),
                  ),
                  SizedBox(height: 60.h),
                  AppButton(text: "Sign Up", onPressed: (){},),
                 ]
               ),
             ),
            ),
          ),
        ],
      ),
    );
  }
}