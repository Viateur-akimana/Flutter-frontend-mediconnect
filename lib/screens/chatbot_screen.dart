// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<String> messages = [];

  Future<void> sendMessage() async {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
        _messageController.clear();
      });

      final response = await http.post(
        Uri.parse('http://your-nodejs-server.com/chat'),
        body: {'message': message},
      );

      if (response.statusCode == 200) {
        final chatbotResponse = response.body;
        setState(() {
          messages.add(chatbotResponse);
        });
      } else {
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return ListTile(
                title: Text(message),
              );
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: sendMessage,
            ),
          ],
        ),
      ],
    );
  }
}