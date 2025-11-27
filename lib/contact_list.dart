import 'package:flutter/material.dart';

class Contact {
  final String ten;
  final String thuDienTu;
  final int sdt;
  Contact({required this.ten, required this.thuDienTu, this.sdt = 0});
}

class SimpleContactScreen extends StatelessWidget {
  final List<Contact> danhSachLienHe = List.generate(
    20,
    (index) => Contact(
      ten: 'Bạn A ${index + 1}',
      thuDienTu: 'lienhe${index + 1}@email.com',
      sdt: 19000000 + index,
    ),
  );

  SimpleContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách bạn bè'),
        backgroundColor: const Color.fromARGB(255, 199, 211, 185),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 161, 123, 123),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: ListView.builder(
        itemCount: danhSachLienHe.length,
        itemBuilder: (context, index) {
          final contactHienTai = danhSachLienHe[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink[100],
              child: const Icon(Icons.star, color: Colors.red),
            ),
            title: Text(
              contactHienTai.ten,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contactHienTai.thuDienTu),
                Text('SĐT: ${contactHienTai.sdt}'),
              ],
            ),
            trailing: const Icon(Icons.chat_bubble_outline),
            onTap: () {
              print('Bạn đã nhấp vào ${contactHienTai.ten}');
            },
          );
        },
      ),
    );
  }
}
