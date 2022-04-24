import 'package:chatbot/current_user.dart';
import 'package:chatbot/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {
  static Future uploadMessage(String message) async {
    final CollectionReference refMessages =
        FirebaseFirestore.instance.collection('messages');
    final newMessage = Message(
      sender: ConversationUsers.sender,
      receiver: ConversationUsers.receiver,
      message: message,
      createAt: DateTime.now(),
    );

    return await refMessages.add(newMessage.toJson());
  }
}
