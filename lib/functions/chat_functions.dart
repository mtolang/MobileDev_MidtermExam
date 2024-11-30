import 'package:flutter/material.dart';

void sendMessage(TextEditingController messageController, List<String> messages, Function updateState) {
  if (messageController.text.isNotEmpty) {
    updateState(() {
      messages.add(messageController.text);
      messageController.clear();
    });
  }
}

void onItemTapped(BuildContext context, int index, Function updateState, Widget bodyScreen) {
  updateState(() {
    if (index == 0) {
 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => bodyScreen),
      );
    }
  });
}

Widget buildMessageBubble(String message, bool isLeftAligned) {
  return Align(
    alignment: isLeftAligned ? Alignment.centerLeft : Alignment.centerRight,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isLeftAligned ? Colors.white : Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 3,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
    ),
  );
}
