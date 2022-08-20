import 'package:flutter/material.dart';

class RelativeDate extends StatelessWidget {
  final DateTime date;
  const RelativeDate({Key? key, required this.date}) : super(key: key);

  String _getString() {
    Duration duration = DateTime.now().difference(date);

    if (duration.inMinutes < 1) {
      return 'now';
    }

    if (duration.inMinutes < 45) {
      return '${duration.inMinutes} minutes ago';
    }

    if (duration.inDays < 1) {
      return '${duration.inHours} hours ago';
    }

    return '${duration.inDays} days ago';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getString(),
      style: Theme.of(context).textTheme.caption,
    );
  }
}
