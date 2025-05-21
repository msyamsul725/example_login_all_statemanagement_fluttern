import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_example/core.dart';

class LoginRipervodController extends StateNotifier<LoginRipervodState> {
  LoginRipervodController() : super(LoginRipervodState());

  Future<void> initializeData() async {
    state = state.copyWith(status: LoginRipervodStatus.loading);
    
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(
        status: LoginRipervodStatus.loaded,
      );
    } catch (e) {
      state = state.copyWith(
        status: LoginRipervodStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }

  void decrement() {
    state = state.copyWith(counter: state.counter - 1);
  }
}
