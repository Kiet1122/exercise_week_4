
# Flutter & Dart Exercises - Tuần 4

## Giới thiệu

Project này tổng hợp **5 bài tập lập trình Flutter/Dart** dành cho người mới học:

1. **ListView** - hiển thị danh sách liên hệ
2. **GridView** - hiển thị bộ sưu tập hình ảnh theo hai kiểu lưới
3. **SharedPreferences** - lưu và hiển thị dữ liệu đơn giản
4. **Asynchronous Programming** - thực hành async/await trong Dart
5. **Isolate** - tính toán nặng trên luồng riêng và giao tiếp giữa isolate

---

## Cấu trúc project

```
lib/
├─ main.dart
├─ simple_shared_pref_page.dart
├─ grid_page.dart
├─ contact_list.dart
├─ async_example_page.dart
├─ challenge1.dart
└─ challenge2.dart
```

---

## Hướng dẫn cài đặt & chạy

1. **Cài Flutter/Dart**
   - [Flutter installation guide](https://docs.flutter.dev/get-started/install)
   - [Dart SDK](https://dart.dev/get-dart) (nếu chạy console app)

2. **Clone project**
```bash
git clone https://github.com/Kiet1122/exercise_week_4.git
cd ex4
```

3. **Cài đặt packages**
```bash
flutter pub get
```

4. **Chạy ứng dụng Flutter**
```bash
flutter run
```

5. **Chạy Isolate Challenge 2 (console)**
```bash
dart run lib/challenge2.dart
```

---

## Chi tiết bài tập

### 1. ListView Exercise
- Hiển thị danh sách cuộn liên hệ (contacts)
- Mỗi mục có avatar placeholder

### 2. GridView Exercise
- Section 1: `GridView.count` - số cột cố định 3, hình vuông
- Section 2: `GridView.extent` - responsive grid, max cross-axis 150
- Mỗi ô: màu sắc, icon căn giữa, nhãn dưới ô

### 3. SharedPreferences Exercise
- TextField nhập tên
- Nút **Save Name** lưu tên
- Nút **Show Name** hiển thị tên đã lưu
- Bonus: Clear dữ liệu, lưu thêm tuổi/email, hiển thị timestamp

### 4. Asynchronous Programming Exercise
- Hiển thị `"Loading user..."`
- Chờ 3 giây (simulate async)
- Hiển thị `"User loaded successfully!"`

### 5. Isolate Exercises

**Challenge 1:**
- Tính factorial số lớn (vd: 20000!)
- Dùng `compute()` để tính trên isolate riêng
- Hiển thị tiến trình & kết quả

**Challenge 2:**
- Console app spawning background isolate
- Worker gửi số ngẫu nhiên mỗi giây
- Main isolate nhận và tính tổng
- Khi tổng > 100, main gửi lệnh stop → worker thoát
