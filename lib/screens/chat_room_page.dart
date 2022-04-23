import 'package:chatbot/components/new_message_text_field.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget{
  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Room"),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: NewMessageTextField(sender: "me"),
          ),
        ],
      ),
    );
  }
}