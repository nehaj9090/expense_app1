import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../model/expenes_model.dart';
import '../../repo/expense_repo.dart';

part 'expense_event.dart';

part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseRepo repo;

  ExpenseBloc({required this.repo}) : super(ExpenseInitialState()) {
    on<AddExpenseEvent>((event, emit) async {
      emit(ExpenseLodingState());
      var check = await repo.addExpense(event.newExpense);
      if (check) {
        var allExpense = await repo.getExpense();
        emit(ExpenseLoadedState(listExpense: allExpense));
      } else {
        emit(ExpenseErrorState(errorMsg: "Expense  not added"));
      }
    });
    on<GetExpenseEvent>((event, emit) async{

      var allExpense = await repo.getExpense();
      emit(ExpenseLoadedState(listExpense: allExpense));

    });


  }
}
