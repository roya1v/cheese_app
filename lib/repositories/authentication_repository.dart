import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  Stream<bool> getAuthenticationState() {
    return FirebaseAuth.instance.authStateChanges().map((user) {
      return user != null;
    });
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return;
  }
}
