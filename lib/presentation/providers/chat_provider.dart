import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  // Controlador que maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: '', fromWho: FromWho.him),
    Message(text: "Hello my friend", fromWho: FromWho.me),
    Message(text: "Are you in your house?", fromWho: FromWho.me),
    Message(text: '', fromWho: FromWho.him)
  ];

  // Future: es para algo que puede o no pasar
  Future<void> sendMessage(String text) async {
    // trim: recortar espacios sobrantes
    // Condicional para que no se envien mensajes vacios
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);

    // Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    print('Cantidad de mensajes: ${messageList.length}');

    // Notifica a provider que algo cambió
    notifyListeners();
    moveScrollToBottom();
  }

  // Mover el Scroll hasta abajo
  Future<void> moveScrollToBottom() async {
    // Animación
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        //offset(compensación): posición
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        // Rebote al final de la animación
        curve: Curves.easeOut);
  }
}
