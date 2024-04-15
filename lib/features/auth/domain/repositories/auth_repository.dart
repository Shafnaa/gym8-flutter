import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/common/entities/user.dart';
import 'package:gym8/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> currentUser();

  Future<Either<Failure, User>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signInWithGoogle();

  Future<Either<Failure, User?>> signOut();
}
