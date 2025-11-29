import 'package:ex4/async_example_page.dart';
import 'package:ex4/challenge1.dart';
import 'package:ex4/challenge2_info_page.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Exercises',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[50],
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _buildExerciseCard(
              context: context,
              title: 'List View',
              subtitle: 'Danh sách liên hệ',
              icon: Icons.contacts,
              color: Colors.blue,
              page: SimpleContactScreen(),
            ),
            SizedBox(height: 12),
            _buildExerciseCard(
              context: context,
              title: 'Grid View',
              subtitle: 'Bộ sưu tập hình ảnh',
              icon: Icons.grid_view,
              color: Colors.green,
              page: GridPage(),
            ),
            SizedBox(height: 12),
            _buildExerciseCard(
              context: context,
              title: 'Shared Preferences',
              subtitle: 'Lưu & hiển thị tên',
              icon: Icons.storage,
              color: Colors.orange,
              page: SimpleSharedPrefListPage(),
            ),
            SizedBox(height: 12),
            _buildExerciseCard(
              context: context,
              title: 'Async',
              subtitle: 'Chờ 3 giây & hiển thị dữ liệu',
              icon: Icons.timer,
              color: Colors.purple,
              page: AsyncExamplePage(),
            ),
            SizedBox(height: 12),
            _buildExerciseCard(
              context: context,
              title: 'Isolate Challenge 1',
              subtitle: 'Tính giai thừa lớn',
              icon: Icons.calculate,
              color: Colors.red,
              page: Challenge1EasyPage(),
            ),
            SizedBox(height: 12),
            _buildExerciseCard(
              context: context,
              title: 'Isolate Challenge 2',
              subtitle: 'Tính tổng số ngẫu nhiên',
              icon: Icons.swap_horiz,
              color: Colors.purple,
              page: Challenge2InfoPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget page,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        trailing: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey[600],
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
      ),
    );
  }
}
