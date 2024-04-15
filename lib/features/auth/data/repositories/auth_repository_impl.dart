import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/common/entities/user.dart';
import 'package:gym8/core/constants/constants.dart';
import 'package:gym8/core/error/exception.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/network/connection_checker.dart';
import 'package:gym8/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:gym8/features/auth/data/models/user_model.dart';
import 'package:gym8/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;
  const AuthRepositoryImpl(
    this.remoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        final session = remoteDataSource.currentUserSession;

        if (session == null) {
          return left(Failure("User not signed in!"));
        }

        return right(
          UserModel(
            id: session.user.id,
            email: session.user.email ?? '',
            name: '',
          ),
        );
      }

      final user = await remoteDataSource.getCurrentUserData();

      if (user == null) {
        return left(Failure("User not signed in!"));
      }

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.signUpWithEmail(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.signInWithEmail(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() {
    return _getUser(() async => await remoteDataSource.signInWithGoogle());
  }

  @override
  Future<Either<Failure, User?>> signOut() async {
    try {
      await remoteDataSource.signOut();

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }
      final user = await fn();

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
