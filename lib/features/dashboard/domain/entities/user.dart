class User {
  final String userName;
  final String firstName;
  final String lastName;
  final String email;

  User({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> jsonUser) {
    return User(
      userName: jsonUser['userName'],
      firstName: jsonUser['firstName'],
      lastName: jsonUser['lastName'],
      email: jsonUser['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
