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
    apiKey: 'AIzaSyA6zbq-A37fWyv9amHyDjwe5PGbIUxVcRQ',
    appId: '1:798111196419:web:68273afb3415b9ef3cf536',
    messagingSenderId: '798111196419',
    projectId: 'mydatabase-db80d',
    authDomain: 'mydatabase-db80d.firebaseapp.com',
    storageBucket: 'mydatabase-db80d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkQO7_N8crLG1BFcJ061lxQk3TyMWEztY',
    appId: '1:798111196419:android:149f77fd0b3692a33cf536',
    messagingSenderId: '798111196419',
    projectId: 'mydatabase-db80d',
    storageBucket: 'mydatabase-db80d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvduta6b5gFtlK5Z3-Qg9WERHW4J3QP0I',
    appId: '1:798111196419:ios:9062d833a9262f233cf536',
    messagingSenderId: '798111196419',
    projectId: 'mydatabase-db80d',
    storageBucket: 'mydatabase-db80d.appspot.com',
    iosClientId: '798111196419-rg3ab4n16qod1u0npqlbe281sdc4et2v.apps.googleusercontent.com',
    iosBundleId: 'com.example.hello',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvduta6b5gFtlK5Z3-Qg9WERHW4J3QP0I',
    appId: '1:798111196419:ios:9062d833a9262f233cf536',
    messagingSenderId: '798111196419',
    projectId: 'mydatabase-db80d',
    storageBucket: 'mydatabase-db80d.appspot.com',
    iosClientId: '798111196419-rg3ab4n16qod1u0npqlbe281sdc4et2v.apps.googleusercontent.com',
    iosBundleId: 'com.example.hello',
  );
}