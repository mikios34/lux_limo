import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> showNotification(String filePath) async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('download');

  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    channelDescription: 'channel_description',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    'Receipt Downloaded',
    'Tap to open receipt',
    platformChannelSpecifics,
    payload: filePath,
  );
  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (details) async {
      // print("Yowwwwwwwwwwwwwwwwwwwwwwwwwwww");
      if (filePath != null) {
        // await openFile(filePath);
        await OpenFile.open(filePath);
      }
    },

    // onSelectNotification: (String payload) async {
    //   if (payload != null) {
    //     await openFile(payload);
    //   }
    // },
  );
}
