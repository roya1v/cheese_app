import 'package:cheese_app/common/relative_date.dart';
import 'package:cheese_app/model/cheese.dart';
import 'package:flutter/material.dart';

class CheeseTile extends StatelessWidget {
  final Cheese cheese;

  const CheeseTile({Key? key, required this.cheese}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  cheese.author ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  width: 8,
                ),
                RelativeDate(date: cheese.createdAt ?? DateTime.now())
              ],
            ),
            Text(
              cheese.body,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }
}
