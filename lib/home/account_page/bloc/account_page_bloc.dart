import 'package:bloc/bloc.dart';
import 'package:cheese_app/repositories/authentication_repository.dart';
import 'package:cheese_app/repositories/guilds_repository.dart';
import 'package:cheese_app/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'account_page_event.dart';
part 'account_page_state.dart';

class AccountPageBloc extends Bloc<AccountPageEvent, AccountPageState> {
  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;
  final GuildsRepository guildsRepository;

  AccountPageBloc(
      {required this.userRepository,
      required this.authenticationRepository,
      required this.guildsRepository})
      : super(AccountPageLoading()) {
    on<AccountPageShowed>((event, emit) async {
      emit(AccountPageLoading());
      var name = await userRepository.getName();
      var guildID = await userRepository.getGuildId();
      var guildName = (await guildsRepository.getGuilds())
          .firstWhere((e) => e.id == guildID)
          .name;
      emit(AccountPageLoaded(userName: name, guildName: guildName));
    });
    on<AccountPageSignOut>((event, emit) {
      emit(AccountPageLoading());
      authenticationRepository.signOut();
    });
  }
}
