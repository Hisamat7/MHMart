import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final Widget? icon;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor = const Color(0xFFF87249), // Orange color
    this.textColor = Colors.white,
    this.width,
    this.height,
    this.borderRadius = 15,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: backgroundColor.withOpacity(0.5),
        minimumSize: Size(
          width ?? 300.w,  // Use provided width or default to 300.w
          height ?? 50.h,  // Use provided height or default to 50.h
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: icon != null ? 16.w : 24.w,
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 24.w,
              height: 24.h,
              child: CircularProgressIndicator(
                color: textColor,
                strokeWidth: 3,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  icon!,
                  SizedBox(width: 8.w),
                ],
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
    );
  }
}