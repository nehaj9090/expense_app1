part of 'expense_bloc.dart';

@immutable
abstract class ExpenseState {}

class ExpenseInitialState extends ExpenseState {}


class ExpenseLodingState  extends ExpenseState {}

class ExpenseLoadedState extends ExpenseState {

  ///yaha hamko expense milega///
  List<ExpenseModel>listExpense;
  ExpenseLoadedState({required this.listExpense});
}

class ExpenseErrorState  extends ExpenseState {


  String errorMsg;
  ExpenseErrorState({required this.errorMsg});
}


