import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/common/entities/user.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/auth/domain/repositories/auth_repository.dart';

class UserSignIn implements UseCase<User, UserSignInParams> {
  final AuthRepository authRepository;
  const UserSignIn(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignInParams params) async {
    return await authRepository.signInWithEmail(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({
    required this.email,
    required this.password,
  });
}
