import 'package:bloc/bloc.dart';
import 'package:cheese_app/model/guild.dart';
import 'package:cheese_app/repositories/guilds_repository.dart';
import 'package:cheese_app/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'guild_selection_event.dart';
part 'guild_selection_state.dart';

class GuildSelectionBloc
    extends Bloc<GuildSelectionEvent, GuildSelectionState> {
  final GuildsRepository guildsRepository;
  final UserRepository userRepository;

  GuildSelectionBloc(
      {required this.guildsRepository, required this.userRepository})
      : super(GuildSelectionInitial()) {
    on<GuildSelectionShowed>((event, emit) async {
      var guilds = await guildsRepository.getGuilds();
      emit(GuildSelectionLoaded(guilds: guilds));
    });

    on<GuildSelectionSelected>(((event, emit) async {
      await userRepository.setGuildId(event.guild.id);
      emit(GuildSelectionCompleted());
    }));
  }
}
