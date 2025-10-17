import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: "AIzaSyBrypB0hUARPLN9oq5qRzeky5rWoAHTNWU",
      authDomain: "martabak-mini-app.firebaseapp.com",
      projectId: "martabak-mini-app",
      storageBucket: "martabak-mini-app.appspot.com", // diperbaiki
      messagingSenderId: "227007268637",
      appId: "1:227007268637:web:8d2733872ac8ab18c403f4",
    );
  }
}
