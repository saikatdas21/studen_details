import 'package:flutter/material.dart';
import 'database_helper.dart';

class ViewStudentsScreen extends StatefulWidget {
  @override
  _ViewStudentsScreenState createState() => _ViewStudentsScreenState();
}

class _ViewStudentsScreenState extends State<ViewStudentsScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _students = [];

  void _loadStudents() async {
    final students = await _dbHelper.fetchStudents();
    setState(() {
      _students = students;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  void _deleteStudent(int id) async {
    await _dbHelper.deleteStudent(id);
    _loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38.withOpacity(0.7),
        title: Center(
          child: Text(
            "View All Students",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) {
          final student = _students[index];
          return ListTile(
            title: Text(student['name']),
            subtitle: Text(student['email']),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteStudent(student['id']),
            ),
          );
        },
      ),
    );
  }
}
