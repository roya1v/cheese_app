import 'package:bloc/bloc.dart';
import 'package:cheese_app/repositories/authentication_repository.dart';
import 'package:cheese_app/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AuthenticationRepository authenticationRepository;
  UserRepository userRepository;

  AppBloc(
      {required this.authenticationRepository, required this.userRepository})
      : super(AppInitial()) {
    authenticationRepository.getAuthenticationState().listen((isLoggedIn) {
      add(AppAuthenticationStateChanged(isLoggedIn: isLoggedIn));
    });
    on<AppAuthenticationStateChanged>((event, emit) async {
      if (event.isLoggedIn) {
        try {
          final guildId = await userRepository.getGuildId();
          if (guildId == null) {
            emit(AppNeedsGuildSelection());
          } else {
            emit(AppLoggedIn());
          }
        } catch (e) {
          emit(AppNeedsGuildSelection());
        }
      } else {
        emit(AppNotLoggedIn());
      }
    });
  }
}
