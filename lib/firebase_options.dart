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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAEahwnUP8HlfvoFtJJJF_8hvmgvHs_YQ',
    appId: '1:702057780335:android:f946481febee4c0c48699a',
    messagingSenderId: '702057780335',
    projectId: 'leisureyatra-4d414',
    databaseURL: 'https://leisureyatra-4d414-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'leisureyatra-4d414.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCC25lITb3zkQ8KiSezIi7Y0bAlqujuRV4',
    appId: '1:702057780335:ios:61753555a5adc17248699a',
    messagingSenderId: '702057780335',
    projectId: 'leisureyatra-4d414',
    databaseURL: 'https://leisureyatra-4d414-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'leisureyatra-4d414.appspot.com',
    iosClientId: '702057780335-o009h01sh0fbj2m7ocbrrdesvd4jjnk9.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelYatra',
  );
}