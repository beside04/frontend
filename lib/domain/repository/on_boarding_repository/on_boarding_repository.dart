import 'package:frontend/core/result.dart';
import 'package:frontend/domain/model/my_information.dart';

abstract class OnBoardingRepository {
  Future<Result<MyInformation>> getMyInformation();

  Future<Result<MyInformation>> putMyInformation({
    required nickname,
    required job,
    required age,
  });
}