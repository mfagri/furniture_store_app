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
    apiKey: 'AIzaSyCIoQoYjBoQmiLRrK1MaikdSN_EPuS2jrQ',
    appId: '1:748402670692:web:7473c72660f1472027b371',
    messagingSenderId: '748402670692',
    projectId: 'chairsapp',
    authDomain: 'chairsapp.firebaseapp.com',
    storageBucket: 'chairsapp.appspot.com',
    measurementId: 'G-BWMHQHDRRY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoqeAnvjQ5g3srn3MDe8-O94RGj2d30BI',
    appId: '1:748402670692:android:373aa2403160da0327b371',
    messagingSenderId: '748402670692',
    projectId: 'chairsapp',
    storageBucket: 'chairsapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBv8QVSIftt40bq5KWZsRaC32QtNq_QDOk',
    appId: '1:748402670692:ios:898f40d1fd4b3aed27b371',
    messagingSenderId: '748402670692',
    projectId: 'chairsapp',
    storageBucket: 'chairsapp.appspot.com',
    iosClientId: '748402670692-fh5po3trivutk4jmrb9bob6joar9hfd9.apps.googleusercontent.com',
    iosBundleId: 'com.example.chairsapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBv8QVSIftt40bq5KWZsRaC32QtNq_QDOk',
    appId: '1:748402670692:ios:e2cbfe606e45b0a527b371',
    messagingSenderId: '748402670692',
    projectId: 'chairsapp',
    storageBucket: 'chairsapp.appspot.com',
    iosClientId: '748402670692-ls5v4khp5e4c696sa5a0e3qnbhm5phco.apps.googleusercontent.com',
    iosBundleId: 'com.example.chairsapp.RunnerTests',
  );
}
