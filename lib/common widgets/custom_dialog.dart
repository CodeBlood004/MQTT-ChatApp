

import 'package:mqtt_chat_app/const/imports.dart';

Future<void> errorDialogue({
  required BuildContext context,
  required String message,
  required String title,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        surfaceTintColor: lightGray,
        title: Row(
          children: <Widget>[
          const Icon(Icons.warning,color: Colors.orange),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                title,
                style: const TextStyle(
                  color: Vx.red400,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: lightGray,
        content: Text(
          message,
          style: const TextStyle(
            color: Vx.black,
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              Expanded(
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Vx.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}