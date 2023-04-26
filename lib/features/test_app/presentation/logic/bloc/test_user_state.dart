// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'test_user_bloc.dart';

@immutable
abstract class TestUserState {}

class TestUserInitial extends TestUserState {}

class TestUserLoadingState extends TestUserState {}

class TestUserLoadedState extends TestUserState {
  final List<TestModel> testModel;

  TestUserLoadedState({required this.testModel});
}

class TestUserErrorState extends TestUserState{
   final CatchException error;

  TestUserErrorState({required this.error});
}


class GetUserIdLoadingState extends TestUserState{}

class GetUserIdLoadedState extends TestUserState {
  final TestModel testModel;
  GetUserIdLoadedState({
    required this.testModel,
  });
}

class GetUserIdErrorState extends TestUserState{
  final CatchException error;

  GetUserIdErrorState({required this.error});
  }