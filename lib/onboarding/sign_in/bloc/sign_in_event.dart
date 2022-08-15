part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInPressed extends SignInEvent {
  final String email;
  final String password;

  const SignInPressed({required this.email, required this.password});
}
