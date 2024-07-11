import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mqtt_chat_app/const/color.dart';
import 'package:mqtt_chat_app/const/image.dart';
import 'package:mqtt_chat_app/const/imports.dart';
import 'package:mqtt_chat_app/views/Message%20Screen/widgets/chat_field.dart';
import 'package:provider/provider.dart';
import 'package:mqtt_chat_app/providers/mqtt_manager_provider.dart';


String? name;

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [];


  @override
  void initState() {
    super.initState();
    _subscribeToMessages();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      final manager =
          Provider.of<MQTTManagerProvider>(context, listen: false).manager;
      final messageText = "2:${_messageController.text.trim()}"; // Add "1:" prefix
      print(manager);
      if (manager != null) {
        manager.publish(messageText);
      }

      setState(() {
        _messages.add(Message(content: messageText, sender: true));
        _messageController.clear();
      });
    }
  }

  void _subscribeToMessages() {
    final manager =
        Provider.of<MQTTManagerProvider>(context, listen: false).manager;

    if (manager != null) {
      manager.subscribe((message) {
        if (message.startsWith("2:")) {
          // Skip adding messages that start with "1:" prefix
          return;
        }else  if (message.contains("Name1: ")) {
          setState(() {
            name = message.replaceFirst("Name1: ", "");
          });
        }else  if (message.startsWith("1:")) {
          setState(() {
            _messages.add(Message(content: message, sender: false));
          });
        }
      });
    }
  }

  String _getDisplayMessage(String message) {
    if (message.startsWith("1:") || message.startsWith("2:")) {
      return message.substring(2); // Remove the prefix "1:" or "2:"
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true);
    return Scaffold(
      backgroundColor: lightGray,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(left: 50.w, top: 40.h),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(emptyProfileImage),
                // Add your avatar image asset here
                radius: 20.0,
              ),
              SizedBox(width: 10.w),
              (name ?? "Name").text.fontFamily(bebasNeue).size(30.sp).make(),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ).paddingOnly(top: 15.r),
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
                  alignment: message.sender
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    decoration: BoxDecoration(
                      color: message.sender ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: _getDisplayMessage(message.content)
                        .text
                        .color(message.sender ? Colors.white : Colors.black)
                        .make(),
                  ),
                );
              },
            ),
          ),
          chatField(onPress: _sendMessage, controller: _messageController),
        ],
      ),
    );
  }
}

class Message {
  final String content;
  final bool sender;

  Message({required this.content, required this.sender});
}
