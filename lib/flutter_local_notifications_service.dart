import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class FlutterLocalNotificationsService {
  // Singleton pattern
  static final FlutterLocalNotificationsService _notificationService =
      FlutterLocalNotificationsService._internal();

  factory FlutterLocalNotificationsService() {
    return _notificationService;
  }

  FlutterLocalNotificationsService._internal();

  static const channelId = "1";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    channelId,
    "asd",
    channelDescription:
        "This channel is responsible for all the local notifications",
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  static final IOSNotificationDetails _iOSNotificationDetails =
      IOSNotificationDetails();

  final NotificationDetails notificationDetails = NotificationDetails(
    android: _androidNotificationDetails,
    iOS: _iOSNotificationDetails,
  );

  Future<void> initFlutterLocalNotificationsPlugin() async {
    final AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    final IOSInitializationSettings iOSInitializationSettings =
        IOSInitializationSettings(
      defaultPresentAlert: false,
      defaultPresentBadge: false,
      defaultPresentSound: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    // *** Initialize timezone here ***
    //tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<void> requestFlutterLocalNotificationsIOSPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> showNotification(
    String body,
  ) async {
    // final FirebaseNotificationModel firebaseNotificationModel =
    //     FirebaseNotificationModel.fromJson(
    //   jsonDecode(body),
    // );
    // if (firebaseNotificationModel.orderId != null) {
    //   SingleOrderCubit.get(navigatorKey.currentContext).getSingOrder(
    //     orderId: firebaseNotificationModel.orderId!,
    //   );
    // }

    await flutterLocalNotificationsPlugin.show(
      0,
      ' ',
      ' ',
      notificationDetails,
    );
  }

  void onSelectNotification(String? orderId) {
    if (orderId != null) {
      // navigateTo(
      //     context: navigatorKey.currentContext,
      //     screen: SingleOrderPhoneScreen(orderId: orderId));
    }
  }
}
