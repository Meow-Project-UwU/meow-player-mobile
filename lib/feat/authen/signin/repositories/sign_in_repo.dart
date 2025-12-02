abstract class SignInRepo {
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
