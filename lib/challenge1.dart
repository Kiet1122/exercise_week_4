import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Challenge1EasyPage extends StatefulWidget {
  const Challenge1EasyPage({super.key});

  @override
  State<Challenge1EasyPage> createState() => _Challenge1EasyPageState();
}

class _Challenge1EasyPageState extends State<Challenge1EasyPage> {
  String trangThai = "Sẵn sàng tính toán";
  BigInt? ketQua;

  static BigInt tinhGiaiThua(int n) {
    BigInt kq = BigInt.one;
    for (int i = 1; i <= n; i++) {
      kq *= BigInt.from(i);
    }
    return kq;
  }

  Future<void> batDauTinh() async {
    setState(() {
      trangThai = "Đang tính...";
      ketQua = null;
    });

    BigInt rs = await compute(tinhGiaiThua, 20000);

    setState(() {
      ketQua = rs;
      trangThai = "Hoàn thành";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tính Giai Thừa"),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: trangThai == "Đang tính..." ? Colors.orange : Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      trangThai,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: batDauTinh,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Tính 20000!",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Kết quả:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    ketQua != null
                        ? ketQua.toString().substring(0, 500) + "..."
                        : "Chưa có kết quả",
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}