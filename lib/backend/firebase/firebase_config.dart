import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBMj47JahKUX7BUcYtBeXT0DkTmOi52f9k",
            authDomain: "i-shim-start.firebaseapp.com",
            projectId: "i-shim-start",
            storageBucket: "i-shim-start.firebasestorage.app",
            messagingSenderId: "688748406988",
            appId: "1:688748406988:web:02224b3c40150a75e03a69",
            measurementId: "G-E8F1HM3QSW"));
  } else {
    await Firebase.initializeApp();
  }
}
