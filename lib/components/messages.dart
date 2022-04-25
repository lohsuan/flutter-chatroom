import 'package:chatbot/components/message.dart';
import 'package:chatbot/current_user.dart';
import 'package:chatbot/services/firebase_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseApi.getMessages(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return buildText('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildText("Loading");
        }
        return ListView(
          reverse: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            bool isMe = data['sender'] == ConversationUsers.sender;
            return MessageWidget(
              isMe: isMe,
              message: data['message'],
              sender: data['sender'],
            );
          }).toList(),
        );
      },
    );
  }

  Widget buildText(String showingText) {
    return Center(
      child: Text(
        showingText,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.blueAccent),
      ),
    );
  }
}
