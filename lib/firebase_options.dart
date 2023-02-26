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
    apiKey: 'AIzaSyBfbwaJbXWLEu0QYc-6Ywz0eddekRXWIE4',
    appId: '1:76167972493:web:c80e54b7f94caab32304c4',
    messagingSenderId: '76167972493',
    projectId: 'projeto-teste-622f4',
    authDomain: 'projeto-teste-622f4.firebaseapp.com',
    storageBucket: 'projeto-teste-622f4.appspot.com',
    measurementId: 'G-TEN67MWM3M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhF_3cQ9Vlv-0cNdfEL04zckKuT1HubBs',
    appId: '1:76167972493:android:c80f35d976c9765d2304c4',
    messagingSenderId: '76167972493',
    projectId: 'projeto-teste-622f4',
    storageBucket: 'projeto-teste-622f4.appspot.com',
  );
}
