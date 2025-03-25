import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage('https://pbs.twimg.com/media/FUsjNfAWYAEpTL_.jpg'),
          ),
        ),
        title: Text('My friend'),
        centerTitle: false,
      ),
    );
  }
}
