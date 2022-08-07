part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppAuthenticationStateChanged extends AppEvent {
  final bool isLoggedIn;

  const AppAuthenticationStateChanged({required this.isLoggedIn});
}
