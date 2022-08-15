part of 'guild_selection_bloc.dart';

abstract class GuildSelectionEvent extends Equatable {
  const GuildSelectionEvent();

  @override
  List<Object> get props => [];
}

class GuildSelectionShowed extends GuildSelectionEvent {}

class GuildSelectionSelected extends GuildSelectionEvent {
  final Guild guild;

  const GuildSelectionSelected({required this.guild});

  @override
  List<Object> get props => [guild];
}
