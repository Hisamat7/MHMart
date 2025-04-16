import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context,
    required VoidCallback onSuccess, // Callback for success
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      
      // Show success feedback
      _showSnackBar(context, 'Successfully signed up!', isError: false);
      
      // Trigger navigation callback
      onSuccess();
    } on FirebaseAuthException catch (e) {
      // Handle specific errors
      String errorMessage = _getErrorMessage(e.code);
      _showSnackBar(context, errorMessage, isError: true);
    } catch (e) {
      // Generic error fallback
      _showSnackBar(context, 'An unexpected error occurred', isError: true);
    }
  }

  // Helper: Convert Firebase error codes to user-friendly messages
  String _getErrorMessage(String code) {
    switch (code) {
      case 'weak-password':
        return 'Password is too weak (min 6 characters)';
      case 'email-already-in-use':
        return 'An account already exists for this email';
      case 'invalid-email':
        return 'Please enter a valid email address';
      default:
        return 'Sign-up failed: $code';
    }
  }

  // Helper: Show a SnackBar with consistent styling
  void _showSnackBar(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}