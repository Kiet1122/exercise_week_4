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
      trangThai = "Đang tính... vui lòng đợi...";
      ketQua = null;
    });

    BigInt rs = await compute(tinhGiaiThua, 20000);

    setState(() {
      ketQua = rs;
      trangThai = "Hoàn thành!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenge 1 – Giai thừa bằng Isolate (Dễ hiểu)"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              trangThai,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: batDauTinh,
              child: const Text("Tính 20000!"),
            ),

            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  ketQua != null
                      ? ketQua.toString().substring(0, 500) + "..."
                      : "Kết quả sẽ hiển thị tại đây",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
