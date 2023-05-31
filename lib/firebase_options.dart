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
    apiKey: 'AIzaSyBGMHGkXpDtuleVOE6x6oAhBuAu2LWbNEE',
    appId: '1:31633447332:web:099870a8608f4cd8500931',
    messagingSenderId: '31633447332',
    projectId: 'flutter-login-920b2',
    authDomain: 'flutter-login-920b2.firebaseapp.com',
    storageBucket: 'flutter-login-920b2.appspot.com',
    measurementId: 'G-0J9VZ5QN88',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhNIvbxbMQNcNXDLfgYSL7gn7hnc_FhO8',
    appId: '1:31633447332:android:42027f705b1bc71e500931',
    messagingSenderId: '31633447332',
    projectId: 'flutter-login-920b2',
    storageBucket: 'flutter-login-920b2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHHGRraLUBYcwJ6u4ZAYVp7-Vb2BE5O90',
    appId: '1:31633447332:ios:9147420c77bfa0c1500931',
    messagingSenderId: '31633447332',
    projectId: 'flutter-login-920b2',
    storageBucket: 'flutter-login-920b2.appspot.com',
    iosBundleId: 'com.example.prueba',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHHGRraLUBYcwJ6u4ZAYVp7-Vb2BE5O90',
    appId: '1:31633447332:ios:ebed0154f08d170c500931',
    messagingSenderId: '31633447332',
    projectId: 'flutter-login-920b2',
    storageBucket: 'flutter-login-920b2.appspot.com',
    iosBundleId: 'com.example.prueba.RunnerTests',
  );
}