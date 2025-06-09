import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String password;

  const SignUpEntity({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [firstName, lastName, userName, email, password];
}
