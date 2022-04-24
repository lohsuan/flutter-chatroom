import 'package:chatbot/current_user.dart';
import 'package:chatbot/screens/chat_room_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String message = '';
  final _controller = TextEditingController();

  void login() async {
    ConversationUsers.sender = message;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChatRoomPage();
    }));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
          child: Container(
        constraints: const BoxConstraints(maxWidth: 300, maxHeight: 240),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
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
                      size: 25,)
                ),
              ),
            ),
            SizedBox(
                height: 50,
                width: 250,
                child: FloatingActionButton(
                  onPressed: _controller.text.isEmpty ? null : login,
                  child: const Text("LOGIN"),
                  backgroundColor: Colors.blue,
                  elevation: 20,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                ))
          ],
        ),
      )),
    );
  }
}
