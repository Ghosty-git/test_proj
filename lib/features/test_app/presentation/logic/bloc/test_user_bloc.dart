import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:test_proj/features/test_app/data/models/test_model.dart';
import 'package:test_proj/features/test_app/domain/use_cases/test_use_case.dart';

import '../../../../../iternal/helpers/catch_exception.dart';

part 'test_user_event.dart';
part 'test_user_state.dart';

@injectable
class TestUserBloc extends Bloc<TestUserEvent, TestUserState> {
  final UseTestCase useCase;
  TestUserBloc(this.useCase) : super(TestUserInitial()) {
    on<TestUserEvent>((event, emit) {});

    on<GetTestUserEvent>(
      (event, emit) async {
        emit(TestUserLoadingState());
        await useCase
            .getTest()
            .then(
              (testModel) => emit(
                TestUserLoadedState(testModel: testModel),
              ),
            )
            .onError(
              (error, stackTrace) => emit(
                TestUserErrorState(
                  error: CatchException.convertException(error),
                ),
              ),
            );

        on<GetUserIdEvent>((event, emit) async {
          emit(TestUserLoadingState());

          await useCase
              .getOneUser(event.id)
              .then((testModel) =>
                  emit(GetUserIdLoadedState(testModel: testModel)))
              .onError((error, stackTrace) => emit(GetUserIdErrorState(
                  error: CatchException.convertException(error))));
        });
      },
    );
  }
}


