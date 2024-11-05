class Student {
  final int? id;
  final String name;
  final String studentId;
  final String email;
  final String phone;
  final String location;

  Student({
    this.id,
    required this.name,
    required this.studentId,
    required this.email,
    required this.phone,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'studentId': studentId,
      'email': email,
      'phone': phone,
      'location': location,
    };
  }
}
