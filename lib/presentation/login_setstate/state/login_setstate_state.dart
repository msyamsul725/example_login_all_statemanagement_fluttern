enum LoginSetstateStatus { initial, loading, loaded, error }

class LoginSetstateState {
  LoginSetstateStatus status;
  int counter;
  String errorMessage;

  LoginSetstateState({
    this.status = LoginSetstateStatus.initial,
    this.counter = 0,
    this.errorMessage = '',
  });
}
