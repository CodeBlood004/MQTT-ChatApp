


import 'package:mqtt_chat_app/common%20widgets/input_decoration.dart';
import 'package:mqtt_chat_app/const/imports.dart';

Widget customTextField({
  required String hint,
  bool enterPrefix = true,
  TextInputType? inputType,
  IconData? suffixIcon,
  IconData? prefixIcon,
  bool obsecure = false,
  int? maxLines = 1,
  Function()? onPress,
  Function(String)? onChange,
  bool? enabled,
  TextEditingController? controller,

}) {
  return TextFormField(
    keyboardType: inputType ,
    onChanged: onChange,
    enabled: enabled,
    obscureText: obsecure,
    controller: controller,
    maxLines: maxLines,
    decoration:  inputDecoration(
      enterPrefix: enterPrefix,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPress: onPress,
      hintText: hint,
    ),

    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please enter your $hint";
      }
      return null;
    },
  );
}
