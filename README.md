Tôi thấy có vấn đề với link ảnh và thiếu ảnh cho Challenge 2. Đây là bản sửa lại:

# Flutter & Dart Exercises – Tuần 4

## Giới thiệu

Project này tổng hợp **5 bài tập lập trình Flutter/Dart** dành cho người mới học, bao gồm:

1. **ListView** – hiển thị danh sách liên hệ
2. **GridView** – hiển thị bộ sưu tập hình ảnh theo hai kiểu lưới
3. **SharedPreferences** – lưu và hiển thị dữ liệu đơn giản
4. **Asynchronous Programming** – thực hành async/await trong Dart
5. **Isolate** – tính toán nặng trên luồng riêng và giao tiếp giữa isolate

Mục tiêu là **luyện tập các widget cơ bản, lập trình bất đồng bộ và xử lý dữ liệu trên Flutter/Dart**.

---

## Ảnh minh họa

### Giao diện chính
![Main Menu](https://res.cloudinary.com/dmnkakpnb/image/upload/v1764384144/ex4-1_jrb0tp.png)

### Danh sách liên hệ
![Contact List](https://res.cloudinary.com/dmnkakpnb/image/upload/v1764384144/ex4-2_mfslzw.png)

### Grid View
![Grid View](https://res.cloudinary.com/dmnkakpnb/image/upload/v1764384144/ex4-3_nzgztc.png)

### Shared Preferences
![Shared Prefs](https://res.cloudinary.com/dmnkakpnb/image/upload/v1764384145/ex4-4_bsjg3x.png)

### Async Example
![Async Demo](https://res.cloudinary.com/dmnkakpnb/image/upload/v1764384145/ex4-51_fce2om.png)

### Challenge 1
![Challenge 1 Demo](https://res.cloudinary.com/dmnkakpnb/image/upload/v1764384144/ex4-6_unrmm9.png)

### Challenge 2
![Challenge 2 Demo](https://res.cloudinary.com/dmnkakpnb/image/upload/v1764384445/ex4-8_xam6ww.png)
---

## Cấu trúc project

```
lib/
    async_example_page.dart
    challenge1.dart
    challenge2.dart
    challenge2_info_page.dart
    contact_list.dart
    grid_page.dart
    main.dart
    simple_shared_pref_page.dart
```

---

## Hướng dẫn cài đặt & chạy

1. **Cài Flutter/Dart**

   * [Flutter installation guide](https://docs.flutter.dev/get-started/install)
   * [Dart SDK](https://dart.dev/get-dart) (nếu chạy console app)

2. **Clone project**

```bash
git clone https://github.com/Kiet1122/exercise_week_4.git
cd ex4
```

3. **Cài đặt packages**

Thêm vào `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.2
```

Chạy:
```bash
flutter pub get
```

4. **Chạy ứng dụng Flutter**

```bash
flutter run
```

Mở menu chính để chọn bài tập.

5. **Chạy Isolate Challenge 2 (console)**

```bash
dart lib/challenge2.dart
```

---

## Chi tiết bài tập

### 1. ListView Exercise - Danh sách liên hệ
* Hiển thị danh sách cuộn liên hệ (contacts)
* Mỗi mục có **avatar với chữ cái đầu**
* Hiển thị tên, email và số điện thoại
* **File**: `contact_list.dart`

### 2. GridView Exercise - Bộ sưu tập hình ảnh
* Section 1: `GridView.count` – số cột cố định 3, hình vuông
* Section 2: `GridView.extent` – responsive grid, max cross-axis 150
* Mỗi ô: màu sắc, icon căn giữa, nhãn dưới ô
* **File**: `grid_page.dart`

### 3. SharedPreferences Exercise - Lưu dữ liệu
* TextField nhập tên, tuổi, email
* Nút **Lưu** lưu dữ liệu vào SharedPreferences
* Nút **Hiển thị** hiển thị danh sách đã lưu
* Nút **Xóa tất cả** xóa toàn bộ dữ liệu
* **File**: `simple_shared_pref_page.dart`

### 4. Asynchronous Programming Exercise - Xử lý bất đồng bộ
* Hiển thị `"Loading user..."`
* Chờ 3 giây (simulate async)
* Hiển thị `"User loaded successfully!"`
* Hiển thị progress indicator khi loading
* **File**: `async_example_page.dart`

### 5. Isolate Exercises - Xử lý đa luồng

**Challenge 1: Tính giai thừa lớn**
* Tính factorial số lớn (vd: 20000!)
* Dùng `compute()` để tính trên isolate riêng
* Hiển thị tiến trình & kết quả (500 ký tự đầu)
* **File**: `challenge1.dart`

**Challenge 2: Tính tổng số ngẫu nhiên**
* Worker isolate gửi số ngẫu nhiên mỗi giây
* Main isolate nhận và tính tổng
* Khi tổng > 100, gửi lệnh stop → worker thoát
* **File**: `challenge2.dart` (Console application)

---

## Các package sử dụng

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.2
```

---

## Lưu ý quan trọng

* **Challenge 2** là console app, chạy bằng lệnh: `dart lib/challenge2.dart`
* Đảm bảo Flutter SDK được cài đặt đúng cách
* Nếu gặp lỗi "Error getting preview", kiểm tra:
  - Kết nối internet để tải ảnh
  - Đường dẫn file có đúng cấu trúc
  - Đã chạy `flutter pub get`
* Code được tổ chức rõ ràng, dễ mở rộng
* UI đơn giản, tập trung vào chức năng chính

