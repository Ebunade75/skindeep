import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAtC7kEPHU7pnZ_SrwwUOPF0UR9Op9DbRU",
            authDomain: "skindeep-cfd04.firebaseapp.com",
            projectId: "skindeep-cfd04",
            storageBucket: "skindeep-cfd04.appspot.com",
            messagingSenderId: "181676437214",
            appId: "1:181676437214:web:714daaacb21d562bbfdc4f",
            measurementId: "G-ZK8Z3F7FGS"));
  } else {
    await Firebase.initializeApp();
  }
}
