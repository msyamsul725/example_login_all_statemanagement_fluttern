import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_example/core.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitState());

  Future<void> initialize() async {
    emit(state.copyWith(status: LoginCubitStatus.loading));
    
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(
        status: LoginCubitStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LoginCubitStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
