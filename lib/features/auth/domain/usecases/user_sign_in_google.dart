import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/common/entities/user.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/auth/domain/repositories/auth_repository.dart';

class UserSignInGoogle implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  const UserSignInGoogle(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.signInWithGoogle();
  }
}
