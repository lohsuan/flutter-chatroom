import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final bool isMe;
  final String sender;

  const MessageWidget(
      {required this.message, required this.isMe, required this.sender});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);
    const borderRadius = BorderRadius.all(radius);

    return Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          if (!isMe)
            Text(
              sender,
              style: const TextStyle(fontSize: 12),
            ),
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              if (!isMe)
                const CircleAvatar(
                  child: Icon(
                    Icons.android,
                    color: Colors.green,
                    size: 25,
                  ),
                  radius: 18,
                  backgroundColor: Colors.blueGrey,
                ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                margin: const EdgeInsets.fromLTRB(16, 5, 16, 16),
                constraints: const BoxConstraints(maxWidth: 240),
                decoration: BoxDecoration(
                  color:
                      isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                  borderRadius: isMe
                      ? borderRadius.subtract(
                          const BorderRadius.only(bottomRight: radius))
                      : borderRadius.subtract(
                          const BorderRadius.only(bottomLeft: radius)),
                ),
                child: buildMessage(),
              ),
              if (isMe)
                const CircleAvatar(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.pinkAccent,
                    size: 20,
                  ),
                  radius: 18,
                ),
            ],
          )
        ]);
  }

  Widget buildMessage() => Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message,
            style: TextStyle(color: isMe ? Colors.black : Colors.white),
          ),
        ],
      );
}
