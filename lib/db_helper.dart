
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'model/category_model.dart';
import 'model/expenes_model.dart';
import 'model/user_model.dart';

class DbHelper {
//user//
  static const USER_TABLE = 'user';
  static const USER_ID = 'user_id';
  static const USER_NAME = 'user_name';
  static const USER_EMAIL = 'user_email';
  static const USER_PASS = 'user_pass';
  static const USER_IMG = 'user_img';
  static const USER_MOBILE_NO = 'user_mobile_no';

//expense///
  static const EXPENSE_TABLE = 'expense_table';
  static const EXPENSE_ID = 'expense_id';
  static const TITLE = 'expense_title';
  static const EXPENSE_DATE = 'expense_date';
  static const AMOUNT = 'expense_amount';
  static const BALANCE = 'expense_balance';
  static const DESC = 'expense_desc';
  static const EXPENSE_TYPE = 'expense_type';
  static const CATAGORY_ID = 'category_id';

  ///category//

  static const CAT_TABLE = 'cat_table';
  static const CAT_ID = 'cat_id';
  static const CAT_TITLE = 'cat_title';
  static const CAT_IMG = 'expense_img';

  Future<Database> openDB() async {
    var mDirectory = await getApplicationDocumentsDirectory();
    await mDirectory.create(recursive: true);
    var mPath = '${mDirectory.path}/expense_db.db';
    return openDatabase(mPath, version: 1, onCreate: (db, version) {
      //user table//
      db.execute(
          'create table $USER_TABLE($USER_ID integer primary key autoincrement,'
              '$USER_NAME text,'
              '$USER_EMAIL text,'
              '$USER_PASS text,'
              '$USER_MOBILE_NO integer )');

      //expense table///
      db.execute('create table $EXPENSE_TABLE('
          '$EXPENSE_ID integer primary key autoincrement,'
          '$EXPENSE_DATE text,'
          '$TITLE text,'
          '$DESC text,'
          '$CATAGORY_ID integer,'
          '$AMOUNT integer,'
          '$BALANCE integer,'
          ' $EXPENSE_TYPE integer,'
          '$USER_ID integer  )');

      //CAT TABLE///
      db.execute('create table $CAT_TABLE('
          '$CAT_ID integer primary key autoincrement,'
          '$CAT_TITLE text,'
          '$CAT_IMG text,'
          ')');

      //defult entry ke liye///

      db.insert(CAT_TABLE,
          CatModel(title: "Grosery", path: "assets/images/logo.png").toMap());

      db.insert(CAT_TABLE,
          CatModel(title: "Grosery", path: "assets/images/logo.png").toMap());

      db.insert(CAT_TABLE,
          CatModel(title: "Movies", path: "assets/images/logo.png").toMap());

      db.insert(CAT_TABLE,
          CatModel(title: "Travel", path: "assets/images/logo.png").toMap());

      db.insert(CAT_TABLE,
          CatModel(title: "Recharge", path: "assets/images/logo.png").toMap());
    });
  }

  ///add data in expense table///
  Future<bool> addExpense(ExpenseModel expense) async {
    var db = await openDB();
    var check = await db.insert(EXPENSE_TABLE, expense.toMap());
    return check > 0;
  }

  ////get data in expense data//

  Future<List<ExpenseModel>> getExpense() async {
    var db = await openDB();
    var sp = await SharedPreferences.getInstance();
    var userid = sp.getInt('userId');
    var expenseList = await db
        .query(EXPENSE_TABLE, where: '$userid = ?', whereArgs: ['$userid']);
    List<ExpenseModel> ListExpenseModel = [];
    for (Map<String, dynamic> expense in expenseList) {
      ListExpenseModel.add(ExpenseModel.fromMap(expense));
    }
    return ListExpenseModel;
  }

  ///get category data//
  Future<List<CatModel>> getCatagories() async {
    var db = await openDB();
    var catData = await db.query(CAT_TABLE);

    List<CatModel> ListcatModel = [];
    for (Map<String, dynamic> cat in catData) {
      ListcatModel.add(CatModel.fromMap(cat));
    }
    return ListcatModel;
  }

////delete data in expense data///

  deleteExpense(String id) async {
    var mDb = await openDB();
    mDb.delete(EXPENSE_TABLE, where: '$EXPENSE_ID = ?', whereArgs: ['$id']);
  }

  ///signup function create in user///

  Future<int> SignUp(UserModel user) async {
    var db = await openDB();
    int check;
    if (!await checkUser(user.email!)) {
      check = await db.insert(USER_TABLE, user.toMap());
    } else
      check = -1;
    return check;
  }

  ///sign in function create to user////

  Future<bool> SignIn(String email, String pass) async {
    var Db = await openDB();
    List<Map<String, dynamic>> data = await Db.query(USER_TABLE,
        where: '$USER_EMAIL = ?'
            ' and $USER_PASS = ?',
        whereArgs: [email, pass]);
    if (data.isNotEmpty) {
      var sp = await SharedPreferences.getInstance();
      sp.setInt('userId', data[0][USER_ID]);
    }
    return data.isNotEmpty;
  }

  ///check user in app///

  Future<bool> checkUser(String email) async {
    var db = await openDB();
    List<Map<String, dynamic>> data = await db
        .query(USER_TABLE, where: '$USER_EMAIL = ?', whereArgs: [email]);
    return data.isEmpty;
  }
}
