// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/test_app/data/repositories/test_repository_impl.dart'
    as _i4;
import '../../features/test_app/domain/repositories/test_repository.dart'
    as _i3;
import '../../features/test_app/domain/use_cases/test_use_case.dart' as _i5;
import '../../features/test_app/presentation/logic/bloc/test_user_bloc.dart'
    as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.TestRepository>(() => _i4.TestRepositoryImpl());
  gh.factory<_i5.UseTestCase>(
      () => _i5.UseTestCase(testRepository: gh<_i3.TestRepository>()));
  gh.factory<_i6.TestUserBloc>(() => _i6.TestUserBloc(gh<_i5.UseTestCase>()));
  return getIt;
}
