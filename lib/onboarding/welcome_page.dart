import 'package:cheese_app/onboarding/sign_in/bloc/sign_in_bloc.dart';
import 'package:cheese_app/onboarding/sign_in/sign_in_page.dart';
import 'package:cheese_app/repositories/authentication_repository.dart';
import 'package:cheese_app/onboarding/sign_up/bloc/sign_up_bloc.dart';
import 'package:cheese_app/onboarding/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  Widget getMobileLayout(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome to CheseeApp',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Expanded(
                    child: Image(image: AssetImage('assets/cheese.png'))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return BlocProvider(
                              child: const SignUpPage(),
                              create: (context) => SignUpBloc(
                                  repository: context.read(),
                                  userRepository: context.read()),
                            );
                          })));
                        }),
                        child: const Text('Sign Up')),
                    OutlinedButton(
                        onPressed: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return BlocProvider(
                              child: const SignInPage(),
                              create: (context) => SignInBloc(
                                  repository:
                                      context.read<AuthenticationRepository>()),
                            );
                          })));
                        }),
                        child: const Text('Sign In')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getDesktopLayout(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Text(
                    'Welcome to CheseeApp',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Expanded(
                    child: Image(
                      image: AssetImage('assets/cheese.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return BlocProvider(
                            child: const SignUpPage(),
                            create: (context) => SignUpBloc(
                                repository: context.read(),
                                userRepository: context.read()),
                          );
                        })));
                      }),
                      child: const Text('Sign Up')),
                  OutlinedButton(
                      onPressed: (() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return BlocProvider(
                            child: const SignInPage(),
                            create: (context) => SignInBloc(
                                repository:
                                    context.read<AuthenticationRepository>()),
                          );
                        })));
                      }),
                      child: const Text('Sign In')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 700) {
      return getDesktopLayout(context);
    } else {
      return getMobileLayout(context);
    }
  }
}
