import 'package:test_proj/features/test_app/data/models/test_model.dart';


abstract class TestRepository{
  Future<List<TestModel>> getTest();
  Future<TestModel> getOneUser(int id,);
}

