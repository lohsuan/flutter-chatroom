import 'package:chatbot/current_user.dart';
import 'package:chatbot/screens/chat_room_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String message = '';
  final _controller = TextEditingController();

  void login() async {
    ConversationUsers.sender = message;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChatRoomPage();
    }));
    _controller.clear();
    setState(() {
      message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Welcome',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.blueAccent),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TextField(
            onChanged: (value) => setState(() {
              message = value;
            }),
            controller: _controller,
            enableSuggestions: true,
            decoration: const InputDecoration(
                hintText: "username",
                hintStyle: TextStyle(color: Colors.black54),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.account_box,
                  color: Colors.blueGrey,
                  size: 25,
                )),
          ),
        ),
        SizedBox(
            height: 50,
            width: 250,
            child: FloatingActionButton(
              onPressed: message.trim().isEmpty ? null : login,
              child: const Text("LOGIN"),
              backgroundColor: Colors.blue,
              elevation: 20,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
            ))
      ],
    );
  }
}
