import 'package:cheese_app/home/account_page/bloc/account_page_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: BlocBuilder<AccountPageBloc, AccountPageState>(
        builder: (context, state) {
          if (state is AccountPageLoaded) {
            return SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headline2,
                          children: <TextSpan>[
                            const TextSpan(text: 'Welcome '),
                            TextSpan(
                                text: state.userName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(text: ' from the '),
                            TextSpan(
                                text: state.guildName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(text: ' guild!'),
                          ],
                        ),
                      ),
                    ),
                    Center(
                        child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Do you want to delete your accoint?'),
                                      content: const Text(
                                          'This is irreversable and you will loose your username!'),
                                    );
                                  });
                            },
                            child: Text(
                              'Delet account',
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: Colors.red),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return BlocProvider.value(
                                      value: context.read<AccountPageBloc>(),
                                      child: AlertDialog(
                                        title: const Text(
                                            'Do you want to sign out?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                FirebaseAuth.instance.signOut();
                                              },
                                              child: const Text('Yes')),
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: const Text('No'))
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: const Text('Sign out')),
                      ],
                    ))
                  ]),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
