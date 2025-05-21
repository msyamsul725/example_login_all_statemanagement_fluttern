import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_example/core.dart';

class LoginRiverpodController extends StateNotifier<LoginRiverpodState> {
  LoginRiverpodController() : super(LoginRiverpodState());

  Future<void> initializeData() async {
    state = state.copyWith(status: LoginRiverpodStatus.loading);
    
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(
        status: LoginRiverpodStatus.loaded,
      );
    } catch (e) {
      state = state.copyWith(
        status: LoginRiverpodStatus.error,
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
