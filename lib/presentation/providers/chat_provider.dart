import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  // Controlador que maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  // Future: es para algo que puede o no pasar
  Future<void> sendMessage(String text) async {
    // trim: recortar espacios sobrantes
    // Condicional para que no se envien mensajes vacios
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);

    // Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    // print('Cantidad de mensajes: ${messageList.length}');

    // Detectar si el usuario hizo una pregunta
    if (text.endsWith('?')) {
      himReply();
    }

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

  // Crear la respuesta de el
  Future<void> himReply() async {
    // Obtener el mensaje de la petición HTTP
    final himMessage = await getYesNoAnswer.getAnswer();

    // Añadimos el mensaje de el a la lista de mensajes
    messageList.add(himMessage);

    // Notificar a provider los cambios
    notifyListeners();

    // Mover el scroll hasta el ultimo mensaje
    moveScrollToBottom();
  }
}
