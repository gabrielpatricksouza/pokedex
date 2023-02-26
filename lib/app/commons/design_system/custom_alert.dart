import 'package:flutter/material.dart';
import 'package:franq/app/modules/login/login_routes.dart';

Future showAlert(context, String message) async {
  await showDialog(
    context: context,
    builder: (_) => Alert(
      message: message,
    ),
  );
}

class Alert extends StatelessWidget {
  final String message;
  const Alert({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10.0),
          const Icon(
            Icons.warning_amber_sharp,
            color: Colors.pinkAccent,
            size: 55,
          ),
          const SizedBox(height: 20.0),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20.0),
          TextButton(
            onPressed: () {
              LoginRoutes.pop();
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.deepPurpleAccent),
            ),
            child: const Text(
              'Okay',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
