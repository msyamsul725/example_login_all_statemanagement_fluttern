enum LoginCubitStatus { initial, loading, loaded, error }

class LoginCubitState {
  final LoginCubitStatus status;
  final int counter;
  final String errorMessage;

  LoginCubitState({
    this.status = LoginCubitStatus.initial,
    this.counter = 0,
    this.errorMessage = '',
  });

  LoginCubitState copyWith({
    LoginCubitStatus? status,
    int? counter,
    String? errorMessage,
  }) {
    return LoginCubitState(
      status: status ?? this.status,
      counter: counter ?? this.counter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
