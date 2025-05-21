enum LoginRipervodStatus { initial, loading, loaded, error }

class LoginRipervodState {
  final LoginRipervodStatus status;
  final int counter;
  final String errorMessage;

  LoginRipervodState({
    this.status = LoginRipervodStatus.initial,
    this.counter = 0,
    this.errorMessage = '',
  });

  LoginRipervodState copyWith({
    LoginRipervodStatus? status,
    int? counter,
    String? errorMessage,
  }) {
    return LoginRipervodState(
      status: status ?? this.status,
      counter: counter ?? this.counter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
