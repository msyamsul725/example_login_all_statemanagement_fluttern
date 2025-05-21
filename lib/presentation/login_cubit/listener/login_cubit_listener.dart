import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_example/core.dart';

class LoginCubitListener extends StatelessWidget {
  final Widget child;
  
  const LoginCubitListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubitCubit, LoginCubitState>(
      listener: (context, state) {
        if (state.status == LoginCubitStatus.loading) {
          // Handle loading state if needed
          // For example, show a loading dialog
        }
        
        if (state.status == LoginCubitStatus.error) {
          // Handle error state
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
        
        if (state.status == LoginCubitStatus.loaded) {
          // Handle loaded state if needed
          // For example, show a success message
        }
      },
      child: child,
    );
  }
}
