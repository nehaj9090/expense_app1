

import '../../../db_helper.dart';
import '../../../model/category_model.dart';
import '../../../model/expenes_model.dart';

class ExpenseRepo {
  DbHelper dbHelper;

  ExpenseRepo({required this.dbHelper});

  Future<bool> addExpense(ExpenseModel newExpense) async {
    var check = await dbHelper.addExpense(newExpense);
    return check;
  }

  Future<List<ExpenseModel>> getExpense() async {
    var data = await dbHelper.getExpense();
    return data;
  }

  Future<List<CatModel>> getCatagories() async {
    var data = await dbHelper.getCatagories();
    return data;
  }
}
