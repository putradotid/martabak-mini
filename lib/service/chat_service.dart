import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatGPTService {
  final String apiKey = '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';

  Future<String> sendMessage(String message) async {
    final url = Uri.parse('https://openrouter.ai/api/v1/chat/completions');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
        'HTTP-Referer': 'https://martabak_mini.dev', // opsional, isi nama app kamu
        'X-Title': 'Flutter Chatbot Dev', // opsional
      },
      body: jsonEncode({
        "model": "mistralai/mistral-7b-instruct:free", // model gratis
        "messages": [
          {"role": "system", "content": "You are a helpful chatbot."},
          {"role": "user", "content": message}
        ]
      }),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      final error = jsonDecode(response.body);
      return 'Error: ${error['error']['message']}';
    }
  }
}
