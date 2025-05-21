import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_example/core.dart';

class LoginProviderView extends StatefulWidget {
  const LoginProviderView({super.key});

  @override
  State<LoginProviderView> createState() => _LoginProviderViewState();
}

class _LoginProviderViewState extends State<LoginProviderView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    // After 1st build() is called
    Provider.of<LoginProviderProvider>(context, listen: false).initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProviderProvider(),
      child: Consumer<LoginProviderProvider>(
        builder: (context, provider, child) {
          if (provider.state.status == LoginProviderStatus.loading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (provider.state.status == LoginProviderStatus.error) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${provider.state.errorMessage}"),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text("LoginProvider"),
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
                        onPressed: () => provider.decrement(),
                        icon: const Icon(Icons.remove, color: Colors.grey),
                      ),
                      Text(
                        "${provider.state.counter}",
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () => provider.increment(),
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
                    onPressed: () => provider.initializeData(),
                    child: const Text("Reload"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
