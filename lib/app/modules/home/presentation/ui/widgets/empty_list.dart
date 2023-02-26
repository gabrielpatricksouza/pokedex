import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Empty list",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
