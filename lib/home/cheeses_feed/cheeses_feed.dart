import 'package:cheese_app/model/cheese.dart';
import 'package:cheese_app/common/relative_date.dart';
import 'package:cheese_app/repositories/cheeses_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheesesFeed extends StatefulWidget {
  const CheesesFeed({Key? key}) : super(key: key);

  @override
  _CheesesFeedState createState() => _CheesesFeedState();
}

class _CheesesFeedState extends State<CheesesFeed> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Cheese>>(
        stream: context.read<CheesesRepository>().getCheesesStream(),
        builder: ((context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return Card(
                      child: ListTile(
                          title: Text(snapshot.data![index].body),
                          trailing: RelativeDate(
                              date: snapshot.data![index].createdAt ??
                                  DateTime.now()),
                          subtitle: Text(snapshot.data![index].author ?? '')));
                }));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
