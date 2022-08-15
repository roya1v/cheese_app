import 'package:bloc/bloc.dart';
import 'package:cheese_app/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationRepository repository;

  SignInBloc({required this.repository}) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {
      if (event is SignInPressed) {
        repository.signIn(email: event.email, password: event.password);
      }
    });
  }
}
