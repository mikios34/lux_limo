import 'package:beyride/screens/splash_page.dart';
import 'package:beyride/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'firebase_options.dart';

late AndroidNotificationChannel channel;

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  isFlutterLocalNotificationsInitialized = true;
}

void main() async {
  await initHiveForFlutter();
  await GetStorage.init();

  GetStorage().write('uid', 1);

  final HttpLink httpLink = HttpLink('https://marrdi.com/api/graphql');

  final ValueNotifier<GraphQLClient> client =
      ValueNotifier(GraphQLClient(link: httpLink, cache: GraphQLCache()));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.client});
  final ValueNotifier<GraphQLClient>? client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: GetMaterialApp(
        title: 'LUX Limo',
        theme: myTheme(),
        home: SplashPage(),
      ),
    );
  }
}
