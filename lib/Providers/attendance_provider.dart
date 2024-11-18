import 'dart:async';
import 'package:flutter/foundation.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<Student> _students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
    Student(name: 'Dani'),
  ];

  final List<AttendanceRecord> _attendanceRecords = [];
  Timer? _timer; 

  List<Student> get students => _students;
  List<AttendanceRecord> get attendanceRecords => _attendanceRecords;

  AttendanceProvider() {
    _startAutoRefresh(); 
  }

  void saveAttendance() {
    int presentCount = _students.where((student) => student.isPresent).length;
    int absentCount = _students.length - presentCount;

    _attendanceRecords.insert(
      0,
      AttendanceRecord(
        date: DateTime.now(),
        presentCount: presentCount,
        absentCount: absentCount,
      ),
    );

    for (var student in _students) {
      student.isPresent = false;
    }

    notifyListeners();
  }

  void toggleStudentPresence(int index) {
    _students[index].isPresent = !_students[index].isPresent;
    notifyListeners();
  }

  void _startAutoRefresh() {
    _timer?.cancel(); 
    _timer = Timer.periodic(Duration(minutes: 1), (_) {
      _clearAttendanceRecords(); 
    });
  }

  void _clearAttendanceRecords() {
    _attendanceRecords.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel(); 
    super.dispose();
  }
}

class Student {
  final String name;
  bool isPresent;

  Student({required this.name, this.isPresent = false});
}

class AttendanceRecord {
  final DateTime date;
  final int presentCount;
  final int absentCount;

  AttendanceRecord({
    required this.date,
    required this.presentCount,
    required this.absentCount,
  });
}
