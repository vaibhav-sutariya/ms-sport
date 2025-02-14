import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/view/messages/chat/widgets/chat_app_bar.dart';
import 'package:ms_sport/view/messages/chat/widgets/receive_message_widget.dart';
import 'package:ms_sport/view/messages/chat/widgets/user_message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.insert(0, {
          "message": _controller.text.trim(),
          "time": _getCurrentTime(),
          "isUser": true
        });
        _controller.clear();
      });

      _scrollToBottom();

      // Simulate received message after a short delay
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          _messages.insert(0, {
            "message": _generateReply(),
            "time": _getCurrentTime(),
            "isUser": false
          });
        });
        _scrollToBottom();
      });
    }
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute}";
  }

  String _generateReply() {
    List<String> replies = [
      "Got it! 👍",
      "Thanks for your message!",
      "I’ll get back to you soon.",
      "Sounds great!",
      "Okay, noted!",
      "Can you clarify?",
      "Interesting!",
    ];
    replies.shuffle();
    return replies.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(text: widget.text),
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Today',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7D848D)),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: _messages.length,
              reverse: true,
              itemBuilder: (context, index) {
                return _messages[index]['isUser']
                    ? buildUserMessage(
                        _messages[index]['message']!, _messages[index]['time']!)
                    : buildReceivedMessage(
                        _messages[index]['message']!,
                        _messages[index]['time']!,
                        "https://randomuser.me/api/portraits/men/1.jpg");
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: AppColors.kPrimaryDark,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type your message",
                        hintStyle: TextStyle(color: AppColors.kPrimaryDark),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: _sendMessage,
                  child: CircleAvatar(
                    backgroundColor: AppColors.kPrimary,
                    child: Icon(Icons.send, color: AppColors.kWhite),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
