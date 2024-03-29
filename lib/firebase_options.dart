// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDaRRvW1PSUhFemvTujoBdq7x3Q7dhIDyg',
    appId: '1:760204081812:web:be6a047b2113c53bc89281',
    messagingSenderId: '760204081812',
    projectId: 'hard-work-4ahif',
    authDomain: 'hard-work-4ahif.firebaseapp.com',
    databaseURL: 'https://hard-work-4ahif-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'hard-work-4ahif.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCv-VzSnRFux0ebll-ozHP-y7B4HWqP2Ks',
    appId: '1:760204081812:android:4f43065396dbbc53c89281',
    messagingSenderId: '760204081812',
    projectId: 'hard-work-4ahif',
    databaseURL: 'https://hard-work-4ahif-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'hard-work-4ahif.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTOyQZg_hcBAaIX1RCLB19uvkRPusELP8',
    appId: '1:760204081812:ios:1c5d09389aa788b3c89281',
    messagingSenderId: '760204081812',
    projectId: 'hard-work-4ahif',
    databaseURL: 'https://hard-work-4ahif-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'hard-work-4ahif.appspot.com',
    iosBundleId: 'com.example.hardWork',
  );
}
