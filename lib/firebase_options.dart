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
    apiKey: 'AIzaSyBJMuUiVNtl6KJZ3WKkVBlQYD7tZM712QM',
    appId: '1:779599283535:web:10a4e4128c8cedd9ed713a',
    messagingSenderId: '779599283535',
    projectId: 'newsapp-e1a2d',
    authDomain: 'newsapp-e1a2d.firebaseapp.com',
    storageBucket: 'newsapp-e1a2d.appspot.com',
    measurementId: 'G-CWKJ4YM7LE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxyDb0UDf1Ln3L_GLUutgrz1BqV7H_niE',
    appId: '1:779599283535:android:706bbf384e3b0347ed713a',
    messagingSenderId: '779599283535',
    projectId: 'newsapp-e1a2d',
    storageBucket: 'newsapp-e1a2d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBG5NMjNBqxcWIA5Y-MsihVXAMmSFv0cY',
    appId: '1:779599283535:ios:9e3515520f803957ed713a',
    messagingSenderId: '779599283535',
    projectId: 'newsapp-e1a2d',
    storageBucket: 'newsapp-e1a2d.appspot.com',
    iosClientId: '779599283535-ut86s5bhis0av154clrt2e40pnmsqqns.apps.googleusercontent.com',
    iosBundleId: 'com.example.newsapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBG5NMjNBqxcWIA5Y-MsihVXAMmSFv0cY',
    appId: '1:779599283535:ios:9e3515520f803957ed713a',
    messagingSenderId: '779599283535',
    projectId: 'newsapp-e1a2d',
    storageBucket: 'newsapp-e1a2d.appspot.com',
    iosClientId: '779599283535-ut86s5bhis0av154clrt2e40pnmsqqns.apps.googleusercontent.com',
    iosBundleId: 'com.example.newsapp',
  );
}
