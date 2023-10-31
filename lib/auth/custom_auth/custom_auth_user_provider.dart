import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class LaisiAgriTechAuthUser {
  LaisiAgriTechAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<LaisiAgriTechAuthUser> laisiAgriTechAuthUserSubject =
    BehaviorSubject.seeded(LaisiAgriTechAuthUser(loggedIn: false));
Stream<LaisiAgriTechAuthUser> laisiAgriTechAuthUserStream() =>
    laisiAgriTechAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
