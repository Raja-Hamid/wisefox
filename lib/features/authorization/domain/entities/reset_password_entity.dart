import 'package:equatable/equatable.dart';

class ResetPasswordEntity extends Equatable {
  final String email;

  const ResetPasswordEntity({required this.email});

  @override
  List<Object?> get props => [email];
}
