import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  Stream<bool> getAuthenticationState() {
    return FirebaseAuth.instance.authStateChanges().map((user) => user != null);
  }

  Future<void> signUp({required String email, required String password}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signIn({required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
