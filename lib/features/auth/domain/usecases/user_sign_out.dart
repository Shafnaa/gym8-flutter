import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/common/entities/user.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/auth/domain/repositories/auth_repository.dart';

class UserSignOut implements UseCase<User?, NoParams> {
  final AuthRepository authRepository;
  const UserSignOut(this.authRepository);

  @override
  Future<Either<Failure, User?>> call(NoParams params) async {
    await authRepository.signOut();

    return right(null);
  }
}
