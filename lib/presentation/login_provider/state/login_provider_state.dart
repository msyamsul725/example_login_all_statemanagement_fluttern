enum LoginProviderStatus { initial, loading, loaded, error }

class LoginProviderState {
  final LoginProviderStatus status;
  final int counter;
  final String errorMessage;

  LoginProviderState({
    this.status = LoginProviderStatus.initial,
    this.counter = 0,
    this.errorMessage = '',
  });

  LoginProviderState copyWith({
    LoginProviderStatus? status,
    int? counter,
    String? errorMessage,
  }) {
    return LoginProviderState(
      status: status ?? this.status,
      counter: counter ?? this.counter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
