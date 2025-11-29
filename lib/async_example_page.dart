import 'package:flutter/material.dart';

class AsyncExamplePage extends StatefulWidget {
  const AsyncExamplePage({super.key});

  @override
  State<AsyncExamplePage> createState() => _AsyncExamplePageState();
}

class _AsyncExamplePageState extends State<AsyncExamplePage> {
  String message = "Loading user...";

  @override
  void initState() {
    super.initState();
    fakeLoadUser();
  }

  Future<void> fakeLoadUser() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      message = "User loaded successfully!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Async Exercise"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            if (message == "Loading user...")
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}