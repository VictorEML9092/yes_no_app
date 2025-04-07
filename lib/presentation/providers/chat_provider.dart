import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola Victor", fromWho: FromWho.me),
    Message(text: "Te envio un mensaje", fromWho: FromWho.him)
  ];
}
