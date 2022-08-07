import 'package:cheese_app/repositories/authentication_repository.dart';
import 'package:cheese_app/onboarding/sign_up/bloc/sign_up_bloc.dart';
import 'package:cheese_app/onboarding/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome to CheseeApp',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Image(image: AssetImage('assets/cheese.png')),
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
                                  repository:
                                      context.read<AuthenticationRepository>()),
                            );
                          })));
                        }),
                        child: const Text('Sign Up')),
                    OutlinedButton(
                        onPressed: (() {}), child: const Text('Sign In')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
