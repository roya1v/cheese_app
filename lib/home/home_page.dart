import 'package:cheese_app/home/account_page/account_page.dart';
import 'package:cheese_app/home/cheese_creation/cheese_creation_page.dart';
import 'package:cheese_app/home/cheeses_feed/cheeses_feed.dart';
import 'package:flutter/material.dart';

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
                    builder: ((context) => const AccountPage())));
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
