// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:test_proj/features/test_app/data/models/test_model.dart';

import 'package:test_proj/features/test_app/domain/repositories/test_repository.dart';

@injectable 
class UseTestCase {
  final TestRepository testRepository;

  UseTestCase({required this.testRepository});

  Future<List<TestModel>> getTest() async => await testRepository.getTest();

  Future<TestModel> getOneUser(int id, ) async => await testRepository.getOneUser(id);
}
