import 'package:state_example/core.dart';

class LoginSetstaeController {
  final state = LoginSetstaeState();

  Future<void> initializeData(Function onStateChanged) async {
    state.status = LoginSetstaeStatus.loading;
    onStateChanged();
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      state.status = LoginSetstaeStatus.loaded;
      onStateChanged();
    } catch (e) {
      state.status = LoginSetstaeStatus.error;
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
