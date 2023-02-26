import 'package:flutter/material.dart';

class ErrorList extends StatelessWidget {
  const ErrorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Erro ao carregar lista",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
