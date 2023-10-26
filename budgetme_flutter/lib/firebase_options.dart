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
        return macos;
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
    apiKey: 'AIzaSyDxfsnYsS2pQCALB2fSeQt18DMrrtB3z-0',
    appId: '1:307944359136:web:444bb7b57cd7fd277ffc85',
    messagingSenderId: '307944359136',
    projectId: 'sign-in-4c930',
    authDomain: 'sign-in-4c930.firebaseapp.com',
    storageBucket: 'sign-in-4c930.appspot.com',
    measurementId: 'G-2VZRVNDY6T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSRNCATSYleXRoeDkt9CSZLHxBXx94dJY',
    appId: '1:307944359136:android:9aefb4768604e2937ffc85',
    messagingSenderId: '307944359136',
    projectId: 'sign-in-4c930',
    storageBucket: 'sign-in-4c930.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbg8knE8PrZXmY2_yahoB41GSlWy6shrY',
    appId: '1:307944359136:ios:76294a986fd7cb8d7ffc85',
    messagingSenderId: '307944359136',
    projectId: 'sign-in-4c930',
    storageBucket: 'sign-in-4c930.appspot.com',
    iosBundleId: 'com.example.budgetmeFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbg8knE8PrZXmY2_yahoB41GSlWy6shrY',
    appId: '1:307944359136:ios:4ef963a77929254c7ffc85',
    messagingSenderId: '307944359136',
    projectId: 'sign-in-4c930',
    storageBucket: 'sign-in-4c930.appspot.com',
    iosBundleId: 'com.example.budgetmeFlutter.RunnerTests',
  );
}
