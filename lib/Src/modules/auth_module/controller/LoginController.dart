import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      // Input validation
      if (email.isEmpty || password.isEmpty) {
        throw 'Email and password cannot be empty';
      }

      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
        throw 'Please enter a valid email address';
      }

      if (password.length < 6) {
        throw 'Password must be at least 6 characters';
      }

      // Firebase authentication
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Optional: Check if email is verified
      if (!userCredential.user!.emailVerified) {
        await _auth.signOut(); // Sign out if email isn't verified
        throw 'Please verify your email first';
      }

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e.code);
    } catch (e) {
      throw _handleGenericError(e);
    }
  }

  String _handleFirebaseError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'invalid-email':
        return 'Invalid email format';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many attempts. Try again later';
      case 'operation-not-allowed':
        return 'Email/password login is not enabled';
      default:
        return 'Login failed. Please try again';
    }
  }

  String _handleGenericError(dynamic error) {
    if (error is String) return error;
    return 'An unexpected error occurred';
  }

  // Additional security methods
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e.code);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}