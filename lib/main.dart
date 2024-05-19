import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/config/routes/routes.dart';
import 'package:gym8/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:gym8/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym8/features/exercise/presentation/bloc/exercise_bloc.dart';
import 'package:gym8/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:gym8/features/exercise/presentation/widgets/main_wrapper.dart';
import 'package:gym8/init_dependencies.dart';
import 'package:gym8/core/theme/theme.dart';
import 'package:gym8/features/auth/presentation/pages/sign_in_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<ExerciseBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<ScheduleBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserSignedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gym 8",
      theme: AppTheme.darkThemeMode,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserSignedIn;
        },
        builder: (context, isSignedIn) {
          if (isSignedIn) {
            return const MainWrapper();
          }

          return const SignInPage();
        },
      ),
    );
  }
}
