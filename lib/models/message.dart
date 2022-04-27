import 'package:chatbot/utils/utils.dart';

class Message {
  final String sender;
  final String receiver;
  final String message;
  final DateTime createAt;

  Message(
      {required this.sender,
      required this.receiver,
      required this.message,
      required this.createAt});

  static Message fromJson(Map<String, dynamic> json) => Message(
        sender: json['sender'],
        receiver: json['receiver'],
        message: json['message'],
        createAt: Utils.toDateTime(json['createAt']),
      );

  Map<String, dynamic> toJson() => {
        'sender': sender,
        'receiver': receiver,
        'message': message,
        'createAt': Utils.fromDateTimeToJson(createAt),
      };
}
