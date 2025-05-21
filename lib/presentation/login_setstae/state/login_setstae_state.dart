enum LoginSetstaeStatus { initial, loading, loaded, error }

class LoginSetstaeState {
  LoginSetstaeStatus status;
  int counter;
  String errorMessage;

  LoginSetstaeState({
    this.status = LoginSetstaeStatus.initial,
    this.counter = 0,
    this.errorMessage = '',
  });
}
