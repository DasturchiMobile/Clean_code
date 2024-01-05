import 'package:test_realsoft/features/home/domain/repository/fake_api_repository.dart';

import '../../domain/Entity/fake_apis_model.dart';

class FakeApiUseCase {
  FakeApiRepository fakeApiRepositoryImp;
  FakeApiUseCase(this.fakeApiRepositoryImp);
  Future<FakeApisModel> call() async {
    return fakeApiRepositoryImp.getData();
  }
}

