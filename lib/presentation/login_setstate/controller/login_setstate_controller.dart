import 'package:state_example/core.dart';

class LoginSetstateController {
  final state = LoginSetstateState();

  Future<void> initializeData(Function onStateChanged) async {
    state.status = LoginSetstateStatus.loading;
    onStateChanged();
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      state.status = LoginSetstateStatus.loaded;
      onStateChanged();
    } catch (e) {
      state.status = LoginSetstateStatus.error;
      state.errorMessage = e.toString();
      onStateChanged();
    }
  }

  void increment() {
    state.counter++;
  }

  void decrement() {
    state.counter--;
  }
}
