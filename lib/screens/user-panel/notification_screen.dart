// ignore: depend_on_referenced_packages
import 'package:firebase_messaging_platform_interface/src/remote_message.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final RemoteMessage message;
  const NotificationScreen({super.key, required this.message});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Card(
        elevation: 5,
        child: ListTile(
          leading: const Icon(Icons.notifications_active),
          title: Text(widget.message.notification!.title.toString()),
          subtitle: Text(widget.message.notification!.body.toString()),
          trailing: Text(widget.message.data['screen'].toString()),
        ),
      ),
    );
  }
}
