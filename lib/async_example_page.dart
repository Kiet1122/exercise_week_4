import 'package:flutter/material.dart';

class AsyncExamplePage extends StatefulWidget {
  const AsyncExamplePage({super.key});

  @override
  State<AsyncExamplePage> createState() => _AsyncExamplePageState();
}

class _AsyncExamplePageState extends State<AsyncExamplePage> {
  String message = "Đang tải dữ liệu người dùng..."; 

  @override
  void initState() {
    super.initState();
    fakeLoadUser(); 
  }

  Future<void> fakeLoadUser() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      message = "Tải dữ liệu thành công!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ví dụ Async (Dễ hiểu)"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
