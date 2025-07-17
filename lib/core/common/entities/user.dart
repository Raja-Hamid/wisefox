import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  const User({this.firstName, this.lastName, this.email, this.password});

  @override
  List<Object?> get props => [firstName, lastName, email, password];
}
