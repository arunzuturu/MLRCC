import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mlrcc/features/auth/controller/auth_controller.dart';
import 'package:mlrcc/features/pposts/controllers/pposts_controller.dart';
import 'package:mlrcc/firebase_options.dart';
import 'package:mlrcc/modals/user_modal.dart';
import 'package:mlrcc/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/common.dart';
import 'features/auth/views/login_view.dart';
import 'features/home/views/nav_view.dart';

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
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MLR College Connect',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: ref.watch(curentUserAccountProvider).when(
            data: (user) {
              if (user != null) {
                getData() {
                  // ref
                  //     .watch(pPostsControllerProvider.notifier)
                  //     .getPPosts(context);
                }

                getData();
                return const NavView();
              }
              return const LoginView();
            },
            error: (error, st) => ErrorPage(error: error.toString()),
            loading: () {
              return const LoadingPage();
            }));
  }
}
