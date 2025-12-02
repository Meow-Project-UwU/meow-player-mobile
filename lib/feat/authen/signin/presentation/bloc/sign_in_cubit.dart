import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loveappcount/app/di/injector.dart';
import 'package:loveappcount/feat/authen/signin/presentation/bloc/sign_in_state.dart';
import 'package:loveappcount/feat/authen/signin/repositories/sign_in_repo.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInRepo _authRepository = injector<SignInRepo>();

  SignInCubit() : super(SignInState());

  Future<void> signIn(String email, String password) async {}
}
