import 'package:flutter/material.dart';

class Contact {
  final String ten;
  final String thuDienTu;
  final int sdt;
  Contact({required this.ten, required this.thuDienTu, this.sdt = 0});
}

class SimpleContactScreen extends StatelessWidget {
  final List<Contact> danhSachLienHe = List.generate(
    10,
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        itemCount: danhSachLienHe.length,
        separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey[300]),
        itemBuilder: (context, index) {
          final contactHienTai = danhSachLienHe[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[50],
              child: Text(
                contactHienTai.ten.substring(0, 1),
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            title: Text(
              contactHienTai.ten,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contactHienTai.thuDienTu),
                Text('0${contactHienTai.sdt}'),
              ],
            ),
          );
        },
      ),
    );
  }
}