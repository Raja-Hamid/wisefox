import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? userName;
  final String? email;
  final String? password;

  const User({
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [firstName, lastName, userName, email, password];
}
