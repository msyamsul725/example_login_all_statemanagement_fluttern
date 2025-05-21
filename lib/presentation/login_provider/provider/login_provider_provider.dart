import 'package:flutter/material.dart';
import 'package:state_example/core.dart';

class LoginProviderProvider extends ChangeNotifier {
  LoginProviderState _state = LoginProviderState();
  
  LoginProviderState get state => _state;

  Future<void> initializeData() async {
    _state = _state.copyWith(status: LoginProviderStatus.loading);
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      _state = _state.copyWith(status: LoginProviderStatus.loaded);
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(
        status: LoginProviderStatus.error,
        errorMessage: e.toString(),
      );
      notifyListeners();
    }
  }

  void increment() {
    _state = _state.copyWith(counter: _state.counter + 1);
    notifyListeners();
  }

  void decrement() {
    _state = _state.copyWith(counter: _state.counter - 1);
    notifyListeners();
  }
}
