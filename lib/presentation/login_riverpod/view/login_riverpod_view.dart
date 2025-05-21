import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_example/core.dart';

final loginRiverpodProvider = StateNotifierProvider<LoginRiverpodController, LoginRiverpodState>((ref) {
  return LoginRiverpodController();
});

class LoginRiverpodView extends ConsumerStatefulWidget {
  const LoginRiverpodView({super.key});

  @override
  ConsumerState<LoginRiverpodView> createState() => _LoginRiverpodViewState();
}

class _LoginRiverpodViewState extends ConsumerState<LoginRiverpodView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    // After 1st build() is called
    ref.read(loginRiverpodProvider.notifier).initializeData();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginRiverpodProvider);

    if (state.status == LoginRiverpodStatus.loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.status == LoginRiverpodStatus.error) {
      return Scaffold(
        body: Center(
          child: Text("Error: ${state.errorMessage}"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginRiverpod"),
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
                  onPressed: () => ref.read(loginRiverpodProvider.notifier).decrement(),
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
                  onPressed: () => ref.read(loginRiverpodProvider.notifier).increment(),
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
              onPressed: () => ref.read(loginRiverpodProvider.notifier).initializeData(),
              child: const Text("Reload"),
            ),
          ],
        ),
      ),
    );
  }
}
