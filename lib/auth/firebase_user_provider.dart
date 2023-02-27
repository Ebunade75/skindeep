import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SdFirebaseUser {
  SdFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SdFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SdFirebaseUser> sdFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SdFirebaseUser>(
      (user) {
        currentUser = SdFirebaseUser(user);
        return currentUser!;
      },
    );
