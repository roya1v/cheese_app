part of 'guild_selection_bloc.dart';

abstract class GuildSelectionState extends Equatable {
  const GuildSelectionState();

  @override
  List<Object> get props => [];
}

class GuildSelectionInitial extends GuildSelectionState {}

class GuildSelectionLoaded extends GuildSelectionState {
  final List<Guild> guilds;

  const GuildSelectionLoaded({required this.guilds});

  @override
  List<Object> get props => [guilds];
}

class GuildSelectionCompleted extends GuildSelectionState {}
