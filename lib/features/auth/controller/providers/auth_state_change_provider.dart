import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/auth/controller/providers/auth_cont_provider.dart';

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});
