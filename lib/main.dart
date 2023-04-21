import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:reddit/core/common/loader.dart';
import 'package:reddit/features/auth/controller/providers/auth_cont_provider.dart';
import 'package:reddit/features/auth/controller/providers/auth_state_change_provider.dart';
import 'package:reddit/features/auth/controller/providers/user_provider.dart';
import 'package:reddit/models/user_model.dart';
import 'package:routemaster/routemaster.dart';
import 'core/common/error_text.dart';
import 'firebase_options.dart';
import 'router.dart';
import 'theme/pallete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;
  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
        data: (data) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: Palette.darkModeAppTheme,
              routerDelegate: RoutemasterDelegate(
                routesBuilder: (context) {
                  if (data != null) {
                    getData(ref, data);
                    if (userModel != null) {
                      return loggedInRouter;
                    }
                  }
                  return loggedOutRouter;
                },
              ),
              routeInformationParser: const RoutemasterParser(),
            ),
        error: (e, s) {
          return ErrorText(error: e.toString());
        },
        loading: () {
          return const Loader();
        });
  }
}
