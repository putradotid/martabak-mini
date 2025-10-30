import 'package:flutter/material.dart';
import 'package:auth_firebase/service/chat_service.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ChatGPTService _chatService = ChatGPTService();
  String responseText = '';

  void sendMessage() async {
    final text = _controller.text;
    final response = await _chatService.sendMessage(text);
    setState(() {
      responseText = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChatGPT Bot')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _controller),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: sendMessage, child: const Text('Kirim')),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(responseText),
              ),
            )
          ],
        ),
      ),
    );
  }
}