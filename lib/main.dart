import 'package:cheese_app/bloc/app_bloc.dart';
import 'package:cheese_app/home/home_page.dart';
import 'package:cheese_app/onboarding/guild_selection/bloc/guild_selection_bloc.dart';
import 'package:cheese_app/onboarding/guild_selection/guild_selection_page.dart';
import 'package:cheese_app/repositories/authentication_repository.dart';
import 'package:cheese_app/repositories/cheeses_repository.dart';
import 'package:cheese_app/onboarding/welcome_page.dart';
import 'package:cheese_app/repositories/guilds_repository.dart';
import 'package:cheese_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:cheese_app/common/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthenticationRepository>(
              create: ((context) => AuthenticationRepository())),
          RepositoryProvider<CheesesRepository>(
              create: ((context) => CheesesRepository())),
          RepositoryProvider<UserRepository>(
              create: ((context) => UserRepository())),
          RepositoryProvider<GuildsRepository>(
              create: ((context) => GuildsRepository()))
        ],
        child: MaterialApp(
            title: 'Cheese app',
            theme: CheeseTheme.lightTheme,
            home: BlocProvider(
              create: (context) => AppBloc(
                  authenticationRepository: AuthenticationRepository(),
                  userRepository: UserRepository()),
              child: const AppPage(),
            )));
  }
}

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: ((context, state) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }),
      child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        if (state is AppNotLoggedIn) {
          return const WelcomePage();
        }
        if (state is AppLoggedIn) {
          return const HomePage();
        }
        if (state is AppNeedsGuildSelection) {
          return BlocProvider(
              create: (context) => GuildSelectionBloc(
                  guildsRepository: context.read(),
                  userRepository: context.read())
                ..add(GuildSelectionShowed()),
              child: const GuildSelectionPage());
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
