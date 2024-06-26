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
    apiKey: 'AIzaSyAuzb1CD-yasoFrEF7MqCF1Hyz3OJ3tWqg',
    appId: '1:720112025543:web:bf280bd2b92ba39716a3e2',
    messagingSenderId: '720112025543',
    projectId: 'todo-app-krainet',
    authDomain: 'todo-app-krainet.firebaseapp.com',
    storageBucket: 'todo-app-krainet.appspot.com',
    measurementId: 'G-V1RZMPNHL0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3tkwSt49hh4QDVsMxoiMAZ09jtLTBs6A',
    appId: '1:720112025543:android:d9aa4ea721e937ba16a3e2',
    messagingSenderId: '720112025543',
    projectId: 'todo-app-krainet',
    storageBucket: 'todo-app-krainet.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCr9x-mygEW0RJQY8tN3txRlTqvDl5A4-4',
    appId: '1:720112025543:ios:29d709a8fff9a72816a3e2',
    messagingSenderId: '720112025543',
    projectId: 'todo-app-krainet',
    storageBucket: 'todo-app-krainet.appspot.com',
    iosBundleId: 'com.krainet.todo',
  );
}
