import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;

  const UserEntity({
     this.id,
     this.firstName,
     this.lastName,
     this.email,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, email];
}
