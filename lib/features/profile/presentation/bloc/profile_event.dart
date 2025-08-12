abstract class ProfileEvent {}

class SignOutRequested extends ProfileEvent {
  SignOutRequested();
}

class FetchProfileDataRequested extends ProfileEvent {
  FetchProfileDataRequested();
}
