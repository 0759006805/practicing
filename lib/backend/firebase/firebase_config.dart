import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBaNtu1O6N7XrlWecd2CkOJEKCW9f_SCXQ",
            authDomain: "practicepresentation-ba803.firebaseapp.com",
            projectId: "practicepresentation-ba803",
            storageBucket: "practicepresentation-ba803.appspot.com",
            messagingSenderId: "356499883164",
            appId: "1:356499883164:web:bd2fe8481350a0b3871959"));
  } else {
    await Firebase.initializeApp();
  }
}
