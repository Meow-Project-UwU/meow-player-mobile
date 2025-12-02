class SignInState {
  final bool isLoading;
  final String? errorMessage;
  final String username;
  final String password;

  SignInState({
    this.isLoading = false,
    this.errorMessage,
    this.username = '',
    this.password = '',
  });

  SignInState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? username,
    String? password,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
