// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final RemoteMessage? message;
  const NotificationScreen({super.key, this.message});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColor,
        title: const Text("Notifications"),
      ),
      body: widget.message != null
          ? Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.notifications_active),
                title: Text(widget.message!.notification!.title.toString()),
                subtitle: Text(widget.message!.notification!.body.toString()),
                trailing: Text(widget.message!.data['screen'].toString()),
              ),
            )
          : const Center(
              child: Text("no Notifications"),
            ),
    );
  }
}
