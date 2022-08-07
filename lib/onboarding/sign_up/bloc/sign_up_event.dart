part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpPressed extends SignUpEvent {
  final String email;
  final String login;
  final String password;

  const SignUpPressed(
      {required this.login, required this.email, required this.password});
}
