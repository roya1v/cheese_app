import 'package:bloc/bloc.dart';
import 'package:cheese_app/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AuthenticationRepository authenticationRepository;

  AppBloc({required this.authenticationRepository}) : super(AppInitial()) {
    authenticationRepository.getAuthenticationState().listen((isLoggedIn) {
      add(AppAuthenticationStateChanged(isLoggedIn: isLoggedIn));
    });
    on<AppEvent>((event, emit) {
      if (event is AppAuthenticationStateChanged) {
        if (event.isLoggedIn) {
          emit(AppLoggedIn());
        } else {
          emit(AppNotLoggedIn());
        }
      }
    });
  }
}
