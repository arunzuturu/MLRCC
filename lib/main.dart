import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mlrcc/features/auth/controller/auth_controller.dart';
import 'package:mlrcc/firebase_options.dart';
import 'package:mlrcc/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/common.dart';
import 'features/auth/views/login_view.dart';
import 'features/home/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'MLR College Connect',
        debugShowCheckedModeBanner: false,
    
        theme: AppTheme.theme,
        home: ref.watch(curentUserAccountProvider).when(
            data: (user) {
              if (user != null) {
                return const HomeView();
              }
              return const LoginView();
            },
            error: (error, st) => ErrorPage(error: error.toString()),
            loading: () {
              return const LoadingPage();
            }));
  }
}
