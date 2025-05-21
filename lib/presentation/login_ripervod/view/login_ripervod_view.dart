import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_example/core.dart';

final loginRipervodProvider = StateNotifierProvider<LoginRipervodController, LoginRipervodState>((ref) {
  return LoginRipervodController();
});

class LoginRipervodView extends ConsumerStatefulWidget {
  const LoginRipervodView({super.key});

  @override
  ConsumerState<LoginRipervodView> createState() => _LoginRipervodViewState();
}

class _LoginRipervodViewState extends ConsumerState<LoginRipervodView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    // After 1st build() is called
    ref.read(loginRipervodProvider.notifier).initializeData();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginRipervodProvider);

    if (state.status == LoginRipervodStatus.loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.status == LoginRipervodStatus.error) {
      return Scaffold(
        body: Center(
          child: Text("Error: ${state.errorMessage}"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginRipervod"),
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
                  onPressed: () => ref.read(loginRipervodProvider.notifier).decrement(),
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
                  onPressed: () => ref.read(loginRipervodProvider.notifier).increment(),
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
              onPressed: () => ref.read(loginRipervodProvider.notifier).initializeData(),
              child: const Text("Reload"),
            ),
          ],
        ),
      ),
    );
  }
}
