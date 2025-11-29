import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleSharedPrefListPage extends StatefulWidget {
  const SimpleSharedPrefListPage({super.key});

  @override
  State<SimpleSharedPrefListPage> createState() =>
      _SimpleSharedPrefListPageState();
}

class _SimpleSharedPrefListPageState extends State<SimpleSharedPrefListPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  List<Map<String, String>> dataList = [];

  Future<void> saveData() async {
    String name = nameController.text.trim();
    if (name.isEmpty) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> currentList = prefs.getStringList('data_list') ?? [];

    Map<String, String> newData = {
      'name': name,
      'age': ageController.text.trim(),
      'email': emailController.text.trim(),
    };

    currentList.add(_mapToString(newData));
    await prefs.setStringList('data_list', currentList);

    nameController.clear();
    ageController.clear();
    emailController.clear();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Đã lưu thành công!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> showList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> currentList = prefs.getStringList('data_list') ?? [];

    setState(() {
      dataList = currentList.map((item) => _stringToMap(item)).toList();
    });
  }

  Future<void> clearList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('data_list');
    setState(() {
      dataList = [];
    });
  }

  String _mapToString(Map<String, String> map) {
    return '${map['name']}|${map['age']}|${map['email']}';
  }

  Map<String, String> _stringToMap(String str) {
    List<String> parts = str.split('|');
    return {
      'name': parts[0],
      'age': parts[1],
      'email': parts[2],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách cá nhân"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Tên",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Tuổi",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: saveData,
                    child: const Text("Lưu"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: showList,
                    child: const Text("Hiển thị"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: clearList,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Xóa tất cả"),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: dataList.isEmpty
                  ? const Center(child: Text("Danh sách trống"))
                  : ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        final item = dataList[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text('${index + 1}'),
                            ),
                            title: Text(item['name']!),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (item['age']!.isNotEmpty)
                                  Text('Tuổi: ${item['age']}'),
                                if (item['email']!.isNotEmpty)
                                  Text('Email: ${item['email']}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}