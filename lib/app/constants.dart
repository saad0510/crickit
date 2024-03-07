import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppConstants {
  static const appTitle = 'CricConnect';
  static const appIdentifier = 'com.cricConnect.app';

  static const bioMinCount = 75;
  static const bioMaxCount = 200;

  static const permanentInfoWarning =
      'Please ensure that the information you enter is accurate and matches your CNIC card as it cannot be modified in the future.';

  static const maxRequestsPerMonth = 4;
}

const notificationschannel = AndroidNotificationChannel(
  'cric_connect_channel',
  'CricConnect Notifications',
  description: 'This channel is used for foreground notifications of Procom.',
  importance: Importance.max,
);

final notificationDetails = NotificationDetails(
  android: AndroidNotificationDetails(
    notificationschannel.id,
    notificationschannel.name,
    channelDescription: notificationschannel.description,
    icon: "@mipmap/ic_launcher",
    importance: Importance.max,
  ),
);
