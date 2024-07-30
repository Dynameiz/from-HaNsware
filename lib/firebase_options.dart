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
    apiKey: 'AIzaSyAD08bPJBSY8rX7gQ7c5OZrJ45ACrjJ5JA',
    appId: '1:640370893478:web:14c6ebabf4553f68cc0a67',
    messagingSenderId: '640370893478',
    projectId: 'from-hansware',
    authDomain: 'from-hansware.firebaseapp.com',
    storageBucket: 'from-hansware.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjKThgiDHd9Pf52jl9QDZ1WiQg8tCVOag',
    appId: '1:640370893478:android:e89d8051a52887e6cc0a67',
    messagingSenderId: '640370893478',
    projectId: 'from-hansware',
    storageBucket: 'from-hansware.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcaWF7-I1hsUIArzeEKvexQhocuyDMLt4',
    appId: '1:640370893478:ios:795ea928dcb03088cc0a67',
    messagingSenderId: '640370893478',
    projectId: 'from-hansware',
    storageBucket: 'from-hansware.appspot.com',
    iosBundleId: 'com.example.fromHansware',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDcaWF7-I1hsUIArzeEKvexQhocuyDMLt4',
    appId: '1:640370893478:ios:795ea928dcb03088cc0a67',
    messagingSenderId: '640370893478',
    projectId: 'from-hansware',
    storageBucket: 'from-hansware.appspot.com',
    iosBundleId: 'com.example.fromHansware',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAD08bPJBSY8rX7gQ7c5OZrJ45ACrjJ5JA',
    appId: '1:640370893478:web:34f1531139d61566cc0a67',
    messagingSenderId: '640370893478',
    projectId: 'from-hansware',
    authDomain: 'from-hansware.firebaseapp.com',
    storageBucket: 'from-hansware.appspot.com',
  );
}