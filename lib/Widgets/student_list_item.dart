import 'package:flutter/material.dart';

class StudentListItem extends StatelessWidget {
  final String name;
  final bool isPresent;
  final ValueChanged<bool?> onChanged;

  const StudentListItem({
    required this.name,
    required this.isPresent,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: Checkbox(value: isPresent, onChanged: onChanged),
    );
  }
}
