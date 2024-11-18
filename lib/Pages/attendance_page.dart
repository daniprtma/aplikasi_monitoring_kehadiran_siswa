import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Pencatatan Kehadiran')),
      body: ListView.builder(
        itemCount: provider.students.length,
        itemBuilder: (context, index) {
          final student = provider.students[index];
          return ListTile(
            title: Text(student.name),
            trailing: Checkbox(
              value: student.isPresent,
              onChanged: (_) => provider.toggleStudentPresence(index),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: provider.students.isEmpty ? null : provider.saveAttendance,
          child: Text('Simpan Kehadiran'),
        ),
      ),
    );
  }
}
