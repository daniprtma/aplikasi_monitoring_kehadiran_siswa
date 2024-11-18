import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: provider.attendanceRecords.isEmpty
          ? Center(
              child: Text(
                'Riwayat kosong. Data akan otomatis diperbarui setiap 1 menit.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: provider.attendanceRecords.length,
              itemBuilder: (context, index) {
                final record = provider.attendanceRecords[index];
                return ListTile(
                  title: Text(
                    'Tanggal: ${record.date.toLocal()}'.split(' ')[0],
                  ),
                  subtitle: Text(
                    'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}',
                  ),
                  leading: Icon(Icons.calendar_today),
                );
              },
            ),
    );
  }
}
