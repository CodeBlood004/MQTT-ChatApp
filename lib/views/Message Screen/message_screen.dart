
import 'package:mqtt_chat_app/const/image.dart';
import 'package:mqtt_chat_app/const/imports.dart';
import 'package:mqtt_chat_app/views/Message%20Screen/widgets/chat_field.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(Message(content: _messageController.text.trim(), isSent: true));
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812), minTextAdapt: true, splitScreenMode: true);
    return Scaffold(
      backgroundColor: lightGray,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(left: 50.w, top: 40.h),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(emptyProfileImage), // Add your avatar image asset here
                radius: 20.0,
              ),
              SizedBox(width: 10.w),
              "Name".text.fontFamily(bebasNeue).size(30.sp).make(),
            ],
          ),
        ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ).paddingOnly( top: 15.r),
        elevation: 1,


      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.w),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isSent ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    decoration: BoxDecoration(
                      color: message.isSent ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: message.content.text.color(message.isSent ? Colors.white : Colors.black).make(),
                  ),
                );
              },
            ),
          ),
            chatField(onPress: _sendMessage , controller: _messageController),
        ],
      ),
    );
  }
}

class Message {
  final String content;
  final bool isSent;

  Message({required this.content, required this.isSent});
}


