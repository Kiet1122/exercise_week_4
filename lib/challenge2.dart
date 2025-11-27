import 'dart:isolate';
import 'dart:math';
import 'dart:async';

int sum = 0;

void main() async {
  print("Main isolate bắt đầu...");

  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn(workerIsolate, receivePort.sendPort);

  SendPort? workerSendPort;

  await for (var message in receivePort) {
    if (message is SendPort) {
      workerSendPort = message;
      print("Worker isolate đã khởi động...");
      continue;
    }

    if (message is int) {
      sum += message;
      print("Nhận: $message | Tổng: $sum");

      if (sum > 100) {
        print("Tổng > 100 → gửi STOP...");
        workerSendPort?.send("STOP");
        isolate.kill(priority: Isolate.immediate);
        receivePort.close();
        break;
      }
    }
  }
}

void workerIsolate(SendPort mainSendPort) {
  final port = ReceivePort();
  mainSendPort.send(port.sendPort);

  final random = Random();

  Timer.periodic(Duration(seconds: 1), (timer) {
    mainSendPort.send(random.nextInt(20) + 1);
  });

  port.listen((msg) {
    if (msg == "STOP") {
      Isolate.exit();
    }
  });
}
