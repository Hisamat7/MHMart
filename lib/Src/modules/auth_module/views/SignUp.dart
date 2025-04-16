import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhmart/Src/const/AppButton.dart';
import 'package:mhmart/Src/modules/auth_module/controller/SignUpController.dart';
import 'package:mhmart/Src/modules/auth_module/views/SignIn.dart';
import 'package:mhmart/Src/modules/HomeScreen/HomePage.dart'; // Import HomePage

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await SignUpController().signUp(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      context: context,
      onSuccess: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      ),
    );

    if (mounted) setState(() => _isLoading = false);
  }

  // --- UI Helpers ---
  Widget _buildHeaderText(String text) {
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

  InputDecoration _buildInputDecoration(String hint, {Widget? suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      fillColor: const Color(0xFFF0FFFF),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide.none,
      ),
      hintText: hint,
      errorStyle: TextStyle(fontSize: 12.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Header Section
          _buildHeader(),

          // Form Section
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
                        _buildFormFields(),
                        SizedBox(height: 30.h),
                        _buildSignUpButton(),
                        _buildSignInRedirect(),
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

  Widget _buildHeader() {
    return Positioned(
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
              "Sign Up",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Please Sign up to continue",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name Field
        _buildHeaderText("Name"),
        SizedBox(height: 15.h),
        TextFormField(
          controller: _nameController,
          validator: (value) => value?.isEmpty ?? true ? 'Please enter your name' : null,
          decoration: _buildInputDecoration("Enter your name"),
        ),

        // Email Field
        SizedBox(height: 20.h),
        _buildHeaderText("Email"),
        SizedBox(height: 15.h),
        TextFormField(
          controller: _emailController,
          validator: (value) {
            if (value?.isEmpty ?? true) return 'Please enter your email';
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
              return 'Invalid email format';
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,
          decoration: _buildInputDecoration("Enter your email"),
        ),

        // Password Field
        SizedBox(height: 20.h),
        _buildHeaderText("Password"),
        SizedBox(height: 15.h),
        TextFormField(
          controller: _passwordController,
          validator: (value) {
            if (value?.isEmpty ?? true) return 'Password required';
            if (value!.length < 6) return 'Minimum 6 characters';
            return null;
          },
          obscureText: !_passwordVisible,
          decoration: _buildInputDecoration(
            "Enter password",
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () => setState(() => _passwordVisible = !_passwordVisible),
            ),
          ),
        ),

        // Confirm Password
        SizedBox(height: 20.h),
        _buildHeaderText("Confirm Password"),
        SizedBox(height: 15.h),
        TextFormField(
          controller: _confirmController,
          validator: (value) {
            if (value != _passwordController.text) return 'Passwords don\'t match';
            return null;
          },
          obscureText: !_confirmPasswordVisible,
          decoration: _buildInputDecoration(
            "Re-enter password",
            suffixIcon: IconButton(
              icon: Icon(
                _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () => setState(() => _confirmPasswordVisible = !_confirmPasswordVisible),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
  return AppButton(
    text: "Sign Up",
    onPressed: _submitForm,
    isLoading: _isLoading,
  );
}

  Widget _buildSignInRedirect() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have an account?"),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SignIn()),
            ),
            child: Text(
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}