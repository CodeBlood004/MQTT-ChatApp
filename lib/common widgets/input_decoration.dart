import 'package:mqtt_chat_app/const/imports.dart';

InputDecoration inputDecoration({
  required bool enterPrefix,
  IconData? suffixIcon,
  IconData? prefixIcon,
  Function()? onPress,
  String? hintText,
}) {
  return InputDecoration(
    suffixIcon: Icon(suffixIcon),
    prefixIcon: Icon(
      prefixIcon,
      size: 30,
    ),
    // labelText: hintText,
    labelStyle: const TextStyle(color: Vx.black),
    contentPadding: const EdgeInsets.all(12),
    hintStyle: const TextStyle(color: Vx.gray500),
    errorStyle: const TextStyle(color: Vx.red500),
    hintText: enterPrefix ? "Enter $hintText" : hintText,
    isDense: true,

    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Vx.gray500),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),

    border: const OutlineInputBorder(
      borderSide: BorderSide(color: Vx.gray500),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );
}
