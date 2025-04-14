import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhmart/Src/const/AppButton.dart';
import 'package:mhmart/Src/const/AppImages.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}


class _SignInState extends State<SignIn> {
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
  Widget widgetForLogo({required String image,Color color = const Color.fromARGB(255, 237, 237, 237)}) {
   return  Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle
                        ),
                        child: Center(child: Image.asset(image)),  
                      );
  }
  bool passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              height: 300,
              width: double.infinity,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Log In",
                      style:
                          TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  Text(
                      "Please Sign in to your existing account",
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
                250, // Adjust this value to position the container below the "Sign in" text
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
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                    SizedBox(height: 30.h),
                     textWidget("Email"),
                    SizedBox(height: 15.h),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value!.isEmpty ? 'Enter your email' : null,
                      decoration: InputDecoration(
                        fillColor:const Color.fromARGB(255, 240, 255, 255),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Enter your Email",
                      ),
                    ),
                    SizedBox(height: 20.h),
                  
                    textWidget("Password"),
                    SizedBox(height: 15.h),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) => value!.isEmpty ? 'Enter your password' : null,
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
                   
                    SizedBox(height: 30.h),
                    AppButton(text: "Sign In", onPressed: (){},),
                    SizedBox(height: 35.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Don't have an account?",style: TextStyle(fontSize: 15.sp)), SizedBox(width: 8.w,),  
                      Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orangeAccent),)
                    ],),
                    SizedBox(height: 20.h),
                    Text("Or",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      widgetForLogo(image: AppImages.googleLogo,),
                      SizedBox(width: 20.w,),  
                    widgetForLogo(image: AppImages.facebookLogo,color: Colors.blueAccent),
                         SizedBox(width: 20.w,),  
                    widgetForLogo(image: AppImages.appleLogo,)
                   ])
                   ]
                 ),
               ),
             ),
            ),
          ),
        ],
      ),
    );
  }
}