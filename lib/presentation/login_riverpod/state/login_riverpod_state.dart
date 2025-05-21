enum LoginRiverpodStatus { initial, loading, loaded, error }

class LoginRiverpodState {
  final LoginRiverpodStatus status;
  final int counter;
  final String errorMessage;

  LoginRiverpodState({
    this.status = LoginRiverpodStatus.initial,
    this.counter = 0,
    this.errorMessage = '',
  });

  LoginRiverpodState copyWith({
    LoginRiverpodStatus? status,
    int? counter,
    String? errorMessage,
  }) {
    return LoginRiverpodState(
      status: status ?? this.status,
      counter: counter ?? this.counter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
