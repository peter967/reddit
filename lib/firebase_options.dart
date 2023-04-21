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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDutzFIKgmniaAfYicsSvGjEKmNfCt8V-g',
    appId: '1:898876733290:web:1d112020e8fef33fcc1713',
    messagingSenderId: '898876733290',
    projectId: 'reddit-202fc',
    authDomain: 'reddit-202fc.firebaseapp.com',
    storageBucket: 'reddit-202fc.appspot.com',
    measurementId: 'G-T522LW60W9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD81sx2pNxlWeR7RUOTBEKXjDVBBiLbnXg',
    appId: '1:898876733290:android:d3406ad8661917accc1713',
    messagingSenderId: '898876733290',
    projectId: 'reddit-202fc',
    storageBucket: 'reddit-202fc.appspot.com',
  );
}