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
    apiKey: 'AIzaSyD1lwKaQWRWxLdtG-4Ma8iuRhnE1u05FoE',
    appId: '1:50158332441:web:12cffdc2626af6ab69d888',
    messagingSenderId: '50158332441',
    projectId: 'notely-b8a28',
    authDomain: 'notely-b8a28.firebaseapp.com',
    storageBucket: 'notely-b8a28.appspot.com',
    measurementId: 'G-6SDRLNWRS3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCceHOo1OGWpdgJt0Nb1aUWvap-bA2LcSM',
    appId: '1:50158332441:android:a78c99dee71bac0169d888',
    messagingSenderId: '50158332441',
    projectId: 'notely-b8a28',
    storageBucket: 'notely-b8a28.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB47a4VSD3MT27Wa-hdfswfd6cSjFYW0X0',
    appId: '1:50158332441:ios:fa4269f2e8ddfb3369d888',
    messagingSenderId: '50158332441',
    projectId: 'notely-b8a28',
    storageBucket: 'notely-b8a28.appspot.com',
    iosBundleId: 'notely.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB47a4VSD3MT27Wa-hdfswfd6cSjFYW0X0',
    appId: '1:50158332441:ios:fa4269f2e8ddfb3369d888',
    messagingSenderId: '50158332441',
    projectId: 'notely-b8a28',
    storageBucket: 'notely-b8a28.appspot.com',
    iosBundleId: 'notely.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD1lwKaQWRWxLdtG-4Ma8iuRhnE1u05FoE',
    appId: '1:50158332441:web:a6404873a57631d369d888',
    messagingSenderId: '50158332441',
    projectId: 'notely-b8a28',
    authDomain: 'notely-b8a28.firebaseapp.com',
    storageBucket: 'notely-b8a28.appspot.com',
    measurementId: 'G-GRM85LGZ6N',
  );
}