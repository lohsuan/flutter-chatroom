import 'package:chatbot/components/messages.dart';
import 'package:chatbot/components/new_message_field.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lobby Channel"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 60),
            child: Messages(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: NewMessageField(),
          ),
        ],
      ),
    );
  }
}
