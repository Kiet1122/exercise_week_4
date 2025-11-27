import 'package:ex4/async_example_page.dart';
import 'package:ex4/challenge1.dart';
import 'package:ex4/grid_page.dart';
import 'package:ex4/simple_shared_pref_page.dart';
import 'package:flutter/material.dart';
import 'contact_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercises',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Exercises')),
      body: ListView(
        children: [
          ListTile(
            title: Text('1. List View – Danh sách liên hệ'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SimpleContactScreen()),
            ),
          ),

          ListTile(
            title: Text('2. Grid View – Bộ sưu tập hình ảnh'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GridPage()),
            ),
          ),

          ListTile(
            title: Text('3. Shared Preferences – Lưu & hiển thị tên'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SimpleSharedPrefListPage(),
              ),
            ),
          ),

          ListTile(
            title: Text('4. Async – Chờ 3 giây & hiển thị dữ liệu'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AsyncExamplePage()),
            ),
          ),

          ListTile(
            title: Text('5.1 Isolate Challenge 1 – Tính giai thừa lớn'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Challenge1EasyPage()),
            ),
          ),
        ],
      ),
    );
  }
}
