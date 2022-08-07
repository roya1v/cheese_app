import 'package:cheese_app/model/cheese.dart';
import 'package:cheese_app/repositories/cheeses_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheeseCreationPage extends StatefulWidget {
  const CheeseCreationPage({Key? key}) : super(key: key);

  @override
  _CheeseCreationPageState createState() => _CheeseCreationPageState();
}

class _CheeseCreationPageState extends State<CheeseCreationPage> {
  String _body = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          TextField(
            onChanged: (value) => _body = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Body',
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await context
                    .read<CheesesRepository>()
                    .create(cheese: Cheese(body: _body));
                Navigator.of(context).pop();
              },
              child: const Text('Submit'))
        ],
      )),
    );
  }
}
