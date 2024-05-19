import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/history/domain/entities/history.dart';
import 'package:gym8/features/history/domain/repositories/history_repository.dart';

class GetAllHistories implements UseCase<List<History>, NoParams> {
  final HistoryRepository historyRepository;
  GetAllHistories(this.historyRepository);

  @override
  Future<Either<Failure, List<History>>> call(NoParams params) async {
    return await historyRepository.getAllHistories();
  }
}
