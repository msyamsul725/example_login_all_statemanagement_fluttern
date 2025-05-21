import 'package:flutter/material.dart';
import 'package:state_example/core.dart';

class LoginSetstateView extends StatefulWidget {
  const LoginSetstateView({super.key});

  @override
  State<LoginSetstateView> createState() => _LoginSetstateViewState();
}

class _LoginSetstateViewState extends State<LoginSetstateView> {
  final controller = LoginSetstateController();
  bool get isLoading => controller.state.status == LoginSetstateStatus.loading;
  bool get hasError => controller.state.status == LoginSetstateStatus.error;
  String get errorMessage => controller.state.errorMessage;
  int get counter => controller.state.counter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    // After 1st build() is called
    controller.initializeData(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (hasError) {
      return Scaffold(
        body: Center(
          child: Text("Error: $errorMessage"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginSetstate"),
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
                  onPressed: () {
                    controller.decrement();
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove, color: Colors.grey),
                ),
                Text(
                  "$counter",
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.increment();
                    setState(() {});
                  },
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
              onPressed: () {
                controller.initializeData(() {
                  setState(() {});
                });
              },
              child: const Text("Reload"),
            ),
          ],
        ),
      ),
    );
  }
}
