import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hello my friend", fromWho: FromWho.me),
    Message(text: "Are you in your house?", fromWho: FromWho.me)
  ];

  // Future: es para algo que puede o no pasar
  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);

    // Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);

    // Notifica a provider que algo cambió
    notifyListeners();
  }
}
