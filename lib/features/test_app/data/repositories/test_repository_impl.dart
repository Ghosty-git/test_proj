
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_proj/features/test_app/data/models/test_model.dart';
import 'package:test_proj/iternal/helpers/api_requester.dart';

import '../../../../iternal/helpers/catch_exception.dart';
import '../../domain/repositories/test_repository.dart';
import '../../presentation/logic/bloc/test_user_bloc.dart';

@Injectable(as: TestRepository)

class TestRepositoryImpl implements TestRepository{
      ApiRequester apiRequester = ApiRequester();
  @override
  Future<List<TestModel>> getTest() async{


      try {
      Response response = await apiRequester.toGet("users",);
      log("user response === ${response.data}");

      if (response.statusCode == 200) {
        List result = response.data;
        return result.map((e)=> TestModel.fromJson(e)).toList();
      }

      throw CatchException.convertException(response);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
  
  @override
  Future<TestModel> getOneUser(int id) async{
    
   try {
        Response response = await apiRequester.toGet("users",param:{
        "id": id,
       });

        if (response.statusCode == 200) {
            return TestModel.fromJson(response.data);
        } 
          throw CatchException.convertException(response);
      } catch (e) {
        throw CatchException.convertException(e);
      }
  }
}