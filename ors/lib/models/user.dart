// lib/models/user.dart

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String loginId;
  final String dob;
  final String gender;
  final String role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.loginId,
    required this.dob,
    required this.gender,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      loginId: json['loginId'],
      dob: json['dob'],
      gender: json['gender'],
      role: json['role'],
    );
  }
}