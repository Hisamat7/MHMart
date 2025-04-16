import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhmart/Src/const/AppButton.dart';
import 'package:mhmart/Src/const/AppImages.dart';
import 'package:mhmart/Src/modules/HomeScreen/HomePage.dart';
import 'package:mhmart/Src/modules/auth_module/controller/LoginController.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Controllers and state variables
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = LoginController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _passwordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Helper widget for section headers
  Widget _buildSectionHeader(String text) {
    return Align(
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

  // Helper widget for social login buttons
  Widget _buildSocialLoginButton({
    required String image,
    Color bgColor = const Color(0xFFEDEDED),
    VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Center(child: Image.asset(image)),
      ),
    );
  }

  // Main login function
  Future<void> _performLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _loginController.login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Header section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250.h,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Please Sign in to your existing account",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main form section
          Positioned(
            top: 220.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 30.h),

                        // Email Field
                        _buildSectionHeader("Email"),
                        SizedBox(height: 15.h),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFF0FFFF),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Enter your Email",
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Password Field
                        _buildSectionHeader("Password"),
                        SizedBox(height: 15.h),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          obscuringCharacter: "*",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () => setState(
                                  () => _passwordVisible = !_passwordVisible),
                            ),
                            fillColor: const Color(0xFFF0FFFF),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Enter password",
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                          ),
                        ),

                        SizedBox(height: 30.h),

                        // Login Button
                        AppButton(
                          text: "Sign In",
                          onPressed: _performLogin,
                          isLoading: _isLoading,
                        ),

                        SizedBox(height: 35.h),

                        // Sign Up Redirect
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: () {
                                // Add navigation to sign up screen
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20.h),

                        // Divider
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Text(
                                "Or",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),

                        SizedBox(height: 30.h),

                        // Social Login Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialLoginButton(
                              image: AppImages.googleLogo,
                            ),
                            SizedBox(width: 20.w),
                            _buildSocialLoginButton(
                              image: AppImages.facebookLogo,
                              bgColor: Colors.blueAccent,
                            ),
                            SizedBox(width: 20.w),
                            _buildSocialLoginButton(
                              image: AppImages.appleLogo,
                            ),
                          ],
                        ),
                      ],
                    ),
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