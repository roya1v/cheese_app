import 'package:bloc/bloc.dart';
import 'package:cheese_app/repositories/authentication_repository.dart';
import 'package:cheese_app/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthenticationRepository repository;
  final UserRepository userRepository;

  SignUpBloc({required this.userRepository, required this.repository})
      : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpPressed) {
        await repository.signUp(email: event.email, password: event.password);
        await userRepository.setName(event.login);
      }
    });
  }
}
