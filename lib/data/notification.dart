import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationApi {
  final _firemsg = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firemsg.requestPermission(
      alert: true,
      badge: true,
      carPlay: true,
    );

    final FCMToken = await _firemsg.getToken();
    print("toeknnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn $FCMToken");
  }
}
