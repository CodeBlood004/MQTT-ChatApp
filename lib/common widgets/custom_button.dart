





import 'package:mqtt_chat_app/const/imports.dart';

Widget customButton({
  required String title,
  required Color buttonColor,
  required Color textColor,
  required Function()? onPress,
  String? prefixLogo,
  bool loading = false, // Default to false
  String? font,
  double? fontSize = 15,
  Color? borderColor,
  (double px, double py) padding = (20.0, 10.0),
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: padding.$1.w, vertical: padding.$2.h),
      backgroundColor: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(color: borderColor ?? Colors.transparent),
      ),
    ),
    onPressed: onPress,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefixLogo != null)
          Container(
            width: 24.w, // Adjust width using ScreenUtil
            height: 24.h, // Adjust height using ScreenUtil
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(prefixLogo),
                fit: BoxFit.fill,
              ),
            ),
          ),
        if (prefixLogo != null) SizedBox(width: 10.w),
        Center(
            child: loading
                ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
              strokeWidth: 2.0,
            )
                : title.text
                .size(fontSize!.sp) // Adjust font size using ScreenUtil
                .fontFamily(font ?? regular)
                .color(textColor)
                .make()),
      ],
    ),
  );
}
