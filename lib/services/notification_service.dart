// ignore_for_file: avoid_print, unused_local_variable

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  //for notification request
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permision');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user provisional granted permision');
    } else {
      Get.snackbar(
        'Notification permission denied',
        "Please allow notifications to receive updates.",
        snackPosition: SnackPosition.BOTTOM,
      );
      Future.delayed(const Duration(seconds: 2), () {
        AppSettings.openAppSettings(type: AppSettingsType.notification);
      });
    }
  }

  //get token
  Future<String> getDeviceToken() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    String? token = await messaging.getToken();
    print("token=> $token");
    return token!;
  }
}
