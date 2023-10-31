import 'dart:async';

import 'custom_auth_user_provider.dart';

export 'custom_auth_manager.dart';

class CustomAuthManager {
  String? authenticationToken;
  String? refreshToken;
  DateTime? tokenExpiration;

  Future signOut() async {
    authenticationToken = null;
    refreshToken = null;
    tokenExpiration = null;
    // Update the current user.
    laisiAgriTechAuthUserSubject.add(
      LaisiAgriTechAuthUser(loggedIn: false),
    );
  }

  Future<LaisiAgriTechAuthUser?> signIn({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) async =>
      _updateCurrentUser(
        authenticationToken: authenticationToken,
        refreshToken: refreshToken,
        tokenExpiration: tokenExpiration,
        authUid: authUid,
      );

  void updateAuthUserData({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) {
    assert(
      currentUser?.loggedIn ?? false,
      'User must be logged in to update auth user data.',
    );

    _updateCurrentUser(
      authenticationToken: authenticationToken,
      refreshToken: refreshToken,
      tokenExpiration: tokenExpiration,
      authUid: authUid,
    );
  }

  LaisiAgriTechAuthUser? _updateCurrentUser({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) {
    this.authenticationToken = authenticationToken;
    this.refreshToken = refreshToken;
    this.tokenExpiration = tokenExpiration;
    // Update the current user stream.
    final updatedUser = LaisiAgriTechAuthUser(
      loggedIn: true,
      uid: authUid,
    );
    laisiAgriTechAuthUserSubject.add(updatedUser);
    return updatedUser;
  }
}

LaisiAgriTechAuthUser? currentUser;
bool get loggedIn => currentUser != null;
