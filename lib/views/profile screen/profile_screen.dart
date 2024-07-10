import 'package:mqtt_chat_app/common%20widgets/custom_button.dart';
import 'package:mqtt_chat_app/common%20widgets/custom_text_field.dart';
import 'package:mqtt_chat_app/const/image.dart';
import 'package:mqtt_chat_app/const/imports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812), minTextAdapt: true, splitScreenMode: true);
    return Scaffold(
      backgroundColor: lightGray,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Center(
            child: "Profile"
                .text
                .fontFamily(bebasNeue).bold
                .size(30.sp)
                .make(),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: 350,
              child: Image.asset(mosquitoLogoHorizontal,),
            ),
            // const HeightBox(),
            const Divider(color: Vx.black, indent: 30, endIndent: 30, thickness: 0),
            const HeightBox(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "User Name".text.make(),
                customTextField(hint: "Full Name", prefixIcon: Icons.person, controller: userNameController),

                const HeightBox(20),
                customButton(title: "Start Messaging", buttonColor: Vx.black, textColor: Vx.white, onPress: (){} , padding: (60,10),fontSize: 15).centered(),

              ],
            ).paddingSymmetric(horizontal: 20)
          ],
        ),
      ).paddingSymmetric(horizontal: 24.w),

    ) ;
  }
}

