import '../Entity/fake_apis_model.dart';

abstract class FakeApiRepository {
  Future<FakeApisModel> getData();
}