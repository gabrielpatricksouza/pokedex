import 'package:flutter/material.dart';

class ErrorAdded extends StatelessWidget {
  const ErrorAdded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Error adding",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
