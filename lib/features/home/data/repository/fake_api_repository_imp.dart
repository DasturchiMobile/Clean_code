import 'dart:convert';

import 'package:test_realsoft/core/api_names.dart';
import 'package:test_realsoft/features/home/domain/repository/fake_api_repository.dart';

import 'package:http/http.dart' as http;

import '../../domain/Entity/fake_apis_model.dart';

class FakeApisRepositoryImp extends FakeApiRepository {
  @override
  Future<FakeApisModel> getData() async {
      try{
        final res = await http.get(Uri.parse(ApiNames.apiUrl));
        if(res.statusCode == 200){
          final body = json.decode(utf8.decode(res.bodyBytes));
          final decodeBody = FakeApisModel.fromJson(body);
          return decodeBody;
        }else{
          throw Exception("Nimadir xato ketdi");
        }
      }catch(e){
        rethrow;
      }
  }
}