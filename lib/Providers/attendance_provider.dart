import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/attendance_record.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<Student> _students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
  ];

  final List<AttendanceRecord> _attendanceRecords = [];

  List<Student> get students => _students;
  List<AttendanceRecord> get attendanceRecords => _attendanceRecords;

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
}
