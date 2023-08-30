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
    apiKey: 'AIzaSyBCaYZnEwoQhCXR8HcaYY8xnw9dcd4pHrk',
    appId: '1:820410646061:web:2bb046f09a66c6b35182a4',
    messagingSenderId: '820410646061',
    projectId: 'fir-test-b95b7',
    authDomain: 'fir-test-b95b7.firebaseapp.com',
    storageBucket: 'fir-test-b95b7.appspot.com',
    measurementId: 'G-ZYL662J2WD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBF4HUiNvXZA4iAib5w4v2u-KGvJzklQOA',
    appId: '1:820410646061:android:350b432a5e8905c45182a4',
    messagingSenderId: '820410646061',
    projectId: 'fir-test-b95b7',
    storageBucket: 'fir-test-b95b7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-DoRJGwmayUn2Ql_ldZx7vqToYw-Gp_g',
    appId: '1:820410646061:ios:f2ab9ecde98db25e5182a4',
    messagingSenderId: '820410646061',
    projectId: 'fir-test-b95b7',
    storageBucket: 'fir-test-b95b7.appspot.com',
    iosClientId: '820410646061-13gqtobfd7qtr7n3fnv4quvbu54pp89j.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseTest',
  );
}
