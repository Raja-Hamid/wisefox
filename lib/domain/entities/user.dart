class User {
  final String userID;
  final String firstName;
  final String lastName;
  final String email;

  User({
    required this.userID,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> jsonUser) {
    return User(
      userID: jsonUser['userID'],
      firstName: jsonUser['firstName'],
      lastName: jsonUser['lastName'],
      email: jsonUser['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
