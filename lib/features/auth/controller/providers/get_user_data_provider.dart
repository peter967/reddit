import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/auth/controller/providers/auth_cont_provider.dart';

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});
