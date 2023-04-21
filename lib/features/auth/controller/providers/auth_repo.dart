import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/core/providers/firebase_provider.dart';
import 'package:reddit/features/auth/repo/auth_repo.dart';

final authRepoProvider = Provider(
  (ref) => AuthRepo(
    firestore: ref.watch(firebaseProvider),
    auth: ref.watch(authProvider),
    signIn: ref.watch(googleSignInProvider),
  ),
);
