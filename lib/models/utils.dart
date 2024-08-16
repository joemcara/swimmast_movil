import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swimmast_movil/main.dart';
import 'package:swimmast_movil/screens/notification_screen.dart';
import 'package:swimmast_movil/shared/constants.dart';

class Utils {
  static Future<String> uploadImage(
      String refPath, String childPath, XFile image) async {
    try {
      String cleanChildPath =
          childPath.trim().replaceAll(" ", "").toLowerCase();
      final ref = FirebaseStorage.instance.ref(refPath).child(cleanChildPath);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      print(url);
      return url;
    } catch (e) {
      throw "Something went wrong.";
    }
  }

  static Future<String> getFCMToken() async {
    final _firebaseMessaging = FirebaseMessaging.instance;
    try {
      await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        provisional: false,
        sound: true,
      );
      String? token = await _firebaseMessaging.getToken();
      print(token);
      await initPushNotifications();
      return token ?? "";
    } catch (e) {
      throw "Something went wrong.";
    }
  }

  static void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => NotificationScreen()),
    );
  }

  static Future initPushNotifications() async {
    final _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      handleMessage(message);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleMessage(message);
    });
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    handleMessage(message);
  }
}
