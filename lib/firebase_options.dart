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
    apiKey: 'AIzaSyD7YY-LDDdW9KzDgA0zWWQWcabnyDvzrB8',
    appId: '1:826737053844:web:44bc970de9f6c033566481',
    messagingSenderId: '826737053844',
    projectId: 'login-signup-app-e3789',
    authDomain: 'login-signup-app-e3789.firebaseapp.com',
    storageBucket: 'login-signup-app-e3789.appspot.com',
    measurementId: 'G-J70EQ1JJ8P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYooHcvPy4FDi7hTM__d6HceaBNJ51Y2Y',
    appId: '1:826737053844:android:e35b754c26dcd397566481',
    messagingSenderId: '826737053844',
    projectId: 'login-signup-app-e3789',
    storageBucket: 'login-signup-app-e3789.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBq8psOkSh20c1ONRtmCrqJ-stQsqpz5fM',
    appId: '1:826737053844:ios:22b3e9cf98d9ede6566481',
    messagingSenderId: '826737053844',
    projectId: 'login-signup-app-e3789',
    storageBucket: 'login-signup-app-e3789.appspot.com',
    iosClientId: '826737053844-3670qu45ekvtvijopl6iisg0uh9cv2cn.apps.googleusercontent.com',
    iosBundleId: 'com.app.loginSingupApp',
  );
}
