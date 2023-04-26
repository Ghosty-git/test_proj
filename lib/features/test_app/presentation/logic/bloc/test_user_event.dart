// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'test_user_bloc.dart';

@immutable
abstract class TestUserEvent {}

class GetTestUserEvent extends TestUserEvent {}

class GetUserIdEvent extends TestUserEvent {
   final int id;
  //  final String name;
  //  final String username;

   
  GetUserIdEvent( {required this.id, });
}
