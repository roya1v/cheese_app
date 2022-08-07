import 'package:bloc/bloc.dart';
import 'package:cheese_app/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthenticationRepository repository;

  SignUpBloc({required this.repository}) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      if (event is SignUpPressed) {
        repository.signUp(email: event.email, password: event.password);
      }
    });
  }
}
