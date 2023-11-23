import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../model/category_model.dart';

import '../../repo/expense_repo.dart';

part 'cat_event.dart';

part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  ExpenseRepo repo;
  CatBloc({required this.repo}) : super(CatInitialState()) {
    on<CatEvent>((event, emit) {

    });

    on<GetCategoriesEvent>((event, emit) async{
      emit(CatLoadingState());
      var allCat = await repo.getCatagories();
      emit(CatLoadedState(listcat: allCat));
    });


  }
}

