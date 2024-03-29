import 'package:chatbot/services/firebase_api.dart';
import 'package:flutter/material.dart';

class NewMessageField extends StatefulWidget {
  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageField> {
  final _controller = TextEditingController();
  String message = '';

  void sendMessage() async {
    await FirebaseApi.uploadMessage(message);
    _controller.clear();
    setState(() {
      message = '';
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                onChanged: (value) => setState(() {
                  message = value;
                }),
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                enableSuggestions: true,
                decoration: const InputDecoration(
                    hintText: "Write message...",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(width: 15),
            FloatingActionButton(
              onPressed: message.trim().isEmpty ? null : sendMessage,
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              backgroundColor: Colors.blue,
              elevation: 0,
            ),
            const SizedBox(width: 8),
          ],
        ),
      );
}
