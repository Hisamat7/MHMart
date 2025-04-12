import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
 
  final String text;
  final VoidCallback? onPressed;
  AppButton({required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      onPressed!();
    }, child: Text(text,style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 248, 114, 73),
            minimumSize: Size(300.w, 50.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r))
          ),
          );
  }
}