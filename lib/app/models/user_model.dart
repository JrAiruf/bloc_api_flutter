import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      avatar: map['avatar'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
