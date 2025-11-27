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
  List<String> nameList = [];

  Future<void> saveName() async {
    String name = nameController.text.trim();
    if (name.isEmpty) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> currentList = prefs.getStringList('name_list') ?? [];

    currentList.add(name);

    await prefs.setStringList('name_list', currentList);

    nameController.clear();

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
    List<String> currentList = prefs.getStringList('name_list') ?? [];

    setState(() {
      nameList = currentList;
    });
  }

  Future<void> clearList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name_list');
    setState(() {
      nameList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Pref Simple List"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nhập tên",
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: saveName, child: const Text("Save")),
                ElevatedButton(
                  onPressed: showList,
                  child: const Text("Show List"),
                ),
                ElevatedButton(
                  onPressed: clearList,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Clear"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: nameList.isEmpty
                  ? const Center(child: Text("Danh sách trống"))
                  : ListView.builder(
                      itemCount: nameList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text("${index + 1}"),
                          title: Text(nameList[index]),
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
