// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDD4oLSWu6oh31hHKuxxDS88gkVq4vitgs',
    appId: '1:704567181111:web:2fbb8d7e6bca682bc224b2',
    messagingSenderId: '704567181111',
    projectId: 'chat-app-16c10',
    authDomain: 'chat-app-16c10.firebaseapp.com',
    storageBucket: 'chat-app-16c10.firebasestorage.app',
    measurementId: 'G-LJ5B798RLQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeSRjankW1XFLq9bUjL_Oq8pfZTncNJkA',
    appId: '1:704567181111:android:5e7a69616a3d07cac224b2',
    messagingSenderId: '704567181111',
    projectId: 'chat-app-16c10',
    storageBucket: 'chat-app-16c10.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBoIJdunjCGreaW_d-kd6Dom9XATWWRO5I',
    appId: '1:704567181111:ios:47c44e7b7f1d871fc224b2',
    messagingSenderId: '704567181111',
    projectId: 'chat-app-16c10',
    storageBucket: 'chat-app-16c10.firebasestorage.app',
    iosBundleId: 'com.example.scholarChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBoIJdunjCGreaW_d-kd6Dom9XATWWRO5I',
    appId: '1:704567181111:ios:47c44e7b7f1d871fc224b2',
    messagingSenderId: '704567181111',
    projectId: 'chat-app-16c10',
    storageBucket: 'chat-app-16c10.firebasestorage.app',
    iosBundleId: 'com.example.scholarChatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDD4oLSWu6oh31hHKuxxDS88gkVq4vitgs',
    appId: '1:704567181111:web:e41ff6a6fc75dc81c224b2',
    messagingSenderId: '704567181111',
    projectId: 'chat-app-16c10',
    authDomain: 'chat-app-16c10.firebaseapp.com',
    storageBucket: 'chat-app-16c10.firebasestorage.app',
    measurementId: 'G-ZQKG100NLL',
  );
}
