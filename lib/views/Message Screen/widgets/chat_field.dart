import 'package:mqtt_chat_app/const/imports.dart';

Widget chatField ({
required TextEditingController controller,
required Function()? onPress,

}
){
  return Padding(
    padding: EdgeInsets.all(10.w),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Type a message",
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send, color: Colors.black),
          onPressed: onPress,
        ),
      ],
    ),
  );
}