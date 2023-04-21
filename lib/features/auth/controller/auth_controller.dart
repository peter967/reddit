import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/auth/controller/providers/user_provider.dart';
import 'package:reddit/features/auth/repo/auth_repo.dart';

import '../../../core/utils.dart';
import '../../../models/user_model.dart';

class AuthController extends StateNotifier<bool> {
  final AuthRepo _authRepo;
  final Ref _ref;
  AuthController({required Ref ref, required authRepo})
      : _authRepo = authRepo,
        _ref = ref,
        super(false);
  Stream<User?> get authStateChange => _authRepo.authStateChange;
  signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authRepo.signInWithGoogle();
    state = false;
    user.fold(
        (l) => showSnackBar(context, l.message),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }

  Stream<UserModel> getUserData(String uid) {
    return _authRepo.getUserData(uid);
  }

  void logOut() async {
    _authRepo.logOut();
  }
}
