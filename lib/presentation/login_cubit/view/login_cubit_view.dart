import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:state_example/core.dart';

class LoginCubitView extends StatefulWidget {
  const LoginCubitView({super.key});

  @override
  State<LoginCubitView> createState() => _LoginCubitViewState();
}

class _LoginCubitViewState extends State<LoginCubitView> {
  late LoginCubitCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = GetIt.I<LoginCubitCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    // After 1st build() is called
    cubit.initialize();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: LoginCubitListener(
        child: BlocBuilder<LoginCubitCubit, LoginCubitState>(
          builder: (context, state) {
            if (state.status == LoginCubitStatus.loading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (state.status == LoginCubitStatus.error) {
              return Scaffold(
                body: Center(
                  child: Text("Error: ${state.errorMessage}"),
                ),
              );
            }

            return Scaffold(
              appBar: AppBar(
                title: const Text("LoginCubit"),
                actions: const [],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "UniqueID: ${UniqueKey()}",
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => context.read<LoginCubitCubit>().decrement(),
                          icon: const Icon(Icons.remove, color: Colors.grey),
                        ),
                        Text(
                          "${state.counter}",
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () => context.read<LoginCubitCubit>().increment(),
                          icon: const Icon(Icons.add, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () => context.read<LoginCubitCubit>().initialize(),
                      child: const Text("Reload"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
