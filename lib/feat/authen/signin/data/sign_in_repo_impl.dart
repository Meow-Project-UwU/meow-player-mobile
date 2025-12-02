import 'package:injectable/injectable.dart';

import '../repositories/sign_in_repo.dart';

@LazySingleton(as: SignInRepo)
class SignInRepoImpl extends SignInRepo {
  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return Future.delayed(const Duration(seconds: 2), () => true);
  }
}
