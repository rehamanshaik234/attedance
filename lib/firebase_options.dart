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
    apiKey: 'AIzaSyACTCIDOMIDlX6H2kHFysM2RPXd7hsf0zE',
    appId: '1:712774668321:web:a740b22b7f702d35a75360',
    messagingSenderId: '712774668321',
    projectId: 'attedance-app-20e39',
    authDomain: 'attedance-app-20e39.firebaseapp.com',
    storageBucket: 'attedance-app-20e39.appspot.com',
    measurementId: 'G-J58K0S605Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDL_Etzug7MsjPZqrf3FQT8-180kx9oWw',
    appId: '1:712774668321:android:2bd7f7b4faa50d08a75360',
    messagingSenderId: '712774668321',
    projectId: 'attedance-app-20e39',
    storageBucket: 'attedance-app-20e39.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDm_LOwUJrGArNpKw8VwIrWr6G0Kkg2e_I',
    appId: '1:712774668321:ios:6f8da1838cb9c021a75360',
    messagingSenderId: '712774668321',
    projectId: 'attedance-app-20e39',
    storageBucket: 'attedance-app-20e39.appspot.com',
    iosClientId: '712774668321-q5m8g43r7go3n528g855s8698pvso8u3.apps.googleusercontent.com',
    iosBundleId: 'com.example.attedance',
  );
}
