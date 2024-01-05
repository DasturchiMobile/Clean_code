import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_realsoft/features/home/data/repository/fake_api_repository_imp.dart';
import 'package:test_realsoft/features/home/data/usecase/fake_api_usecase.dart';

import '../../domain/Entity/fake_apis_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {

    });
    on<HomeFetchData>((event, emit) async {
      try{
        print("init");
        emit(HomeLoading());
        print("HomeLoading");
         final res = await FakeApiUseCase(FakeApisRepositoryImp()).call();
        print("res");
        emit(HomeSuccess(count: event.count, entries: res.entries!));
      }catch(e){
        emit(HomeError(errorMsg: e.toString()));
      }
    });

  }
}
