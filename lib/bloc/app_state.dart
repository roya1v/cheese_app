part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class AppLoggedIn extends AppState {}

class AppNotLoggedIn extends AppState {}

class AppNeedsGuildSelection extends AppState {}
