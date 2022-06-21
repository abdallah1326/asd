import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseHelper {
  static final firebaseMsgInstance = FirebaseMessaging.instance;

  static Future init() async {
    await Firebase.initializeApp();
    //await _firebaseMsgInstance.subscribeToTopic('joaan');
  }

  static Future<String> getFirebaseToken() async {
    return (await firebaseMsgInstance.getToken())!;
  }
}
