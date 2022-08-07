import 'package:flutter/material.dart';

class GuildSelectionPage extends StatefulWidget {
  const GuildSelectionPage({Key? key}) : super(key: key);

  @override
  _GuildSelectionPageState createState() => _GuildSelectionPageState();
}

class _GuildSelectionPageState extends State<GuildSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: ((context, index) {
            return const Card(
              child: ListTile(title: Text('Test')),
            );
          })),
    );
  }
}
