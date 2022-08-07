import 'package:cheese_app/bloc/app_bloc.dart';
import 'package:cheese_app/repositories/authentication_repository.dart';
import 'package:cheese_app/repositories/cheeses_repository.dart';
import 'package:cheese_app/onboarding/welcome_page.dart';
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

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  late AppBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AppBloc(authenticationRepository: _authenticationRepository);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthenticationRepository>(
              create: ((context) => _authenticationRepository)),
          RepositoryProvider<CheesesRepository>(
              create: ((context) => CheesesRepository()))
        ],
        child: MaterialApp(
            title: 'Cheese app',
            theme: CheeseTheme.lightTheme,
            home: const WelcomePage()));
  }
}
