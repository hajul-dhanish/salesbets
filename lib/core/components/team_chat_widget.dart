import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesbets/models/message_model.dart';
import 'package:salesbets/repository/app_state.dart';

class StreamChatWidget extends StatefulWidget {
  final List<Message> chatMessages;
  const StreamChatWidget({super.key, required this.chatMessages});

  @override
  State<StreamChatWidget> createState() => _StreamChatWidgetState();
}

class _StreamChatWidgetState extends State<StreamChatWidget> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage(BuildContext context) {
    if (_textController.text.isNotEmpty) {
      Provider.of<AppState>(
        context,
        listen: false,
      ).sendMessage(_textController.text);
      _textController.clear();
      // Scroll to the bottom of the chat.
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Live Chat', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(8.0),
            itemCount: widget.chatMessages.length,
            itemBuilder: (context, index) {
              final message = widget.chatMessages[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${message.sender}: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      TextSpan(
                        text: message.text,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Say something...',
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send_rounded,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => _sendMessage(context),
            ),
          ],
        ),
      ],
    );
  }
}
