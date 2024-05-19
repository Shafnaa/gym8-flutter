part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initExercise();
  _initSchedule();

  final supabase = await Supabase.initialize(
    url: EnvironmentConfig.publicSupabaseUrl,
    anonKey: EnvironmentConfig.publicSupabaseAnonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);

  serviceLocator.registerFactory(() => InternetConnection());

  // core
  serviceLocator.registerLazySingleton(
    () => AppUserCubit(),
  );

  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignIn(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignInGoogle(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignOut(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(() => AuthBloc(
          userSignUp: serviceLocator(),
          userSignIn: serviceLocator(),
          userSignInGoogle: serviceLocator(),
          userSignOut: serviceLocator(),
          currentUser: serviceLocator(),
          appUserCubit: serviceLocator(),
        ));
}

void _initExercise() {
  serviceLocator
    // Datasource
    ..registerFactory<ExerciseRemoteDataSource>(
      () => ExerciseRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    // Repository
    ..registerFactory<ExerciseRepository>(
      () => ExerciseRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetAllExercises(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetExercise(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => ExerciseBloc(
        getAllExercises: serviceLocator(),
        getExercise: serviceLocator(),
      ),
    );
}

void _initSchedule() {
  serviceLocator
    // Data Source
    ..registerFactory<ScheduleRemoteDataSource>(
      () => ScheduleRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    // Repository
    ..registerFactory<ScheduleRepository>(
      () => ScheduleRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetAllSchedules(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerFactory(
      () => ScheduleBloc(
        getAllSchedules: serviceLocator(),
      ),
    );
}
