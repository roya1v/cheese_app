import 'package:cheese_app/home/account_page/account_page.dart';
import 'package:cheese_app/home/account_page/bloc/account_page_bloc.dart';
import 'package:cheese_app/home/cheese_creation/cheese_creation_page.dart';
import 'package:cheese_app/home/cheeses_feed/cheeses_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => BlocProvider(
                          create: (context) => AccountPageBloc(
                              userRepository: context.read(),
                              authenticationRepository: context.read(),
                              guildsRepository: context.read())
                            ..add(AccountPageShowed()),
                          child: const AccountPage(),
                        ))));
              },
              child: const Icon(Icons.person))
        ],
      ),
      body: const CheesesFeed(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CheeseCreationPage()));
        },
      ),
    );
  }
}
