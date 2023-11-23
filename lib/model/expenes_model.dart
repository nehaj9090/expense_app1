
import '../db_helper.dart';

class ExpenseModel{

  int? id;
  String? title;
  String? date;
  String?  amount;
  String? balance;
  String? desc;
  String? type;
  String? catagory_id;




  ExpenseModel({
    this.id,
    this.title,
    this.date,
    this.amount,
    this.desc,
    this.balance,
    this.type,
    this.catagory_id


  });


  factory ExpenseModel.fromMap(Map<String, dynamic>map){
    return ExpenseModel(
      id: map[DbHelper.EXPENSE_ID],
      title: map[DbHelper.TITLE],
      date: map[DbHelper.EXPENSE_DATE],
      amount: map[DbHelper.AMOUNT],
      desc: map[DbHelper.DESC],
      balance: map[DbHelper.BALANCE],
      type: map[DbHelper.EXPENSE_TYPE],
      catagory_id: map[DbHelper.CATAGORY_ID],



    );
  }


  Map<String, dynamic>toMap(){
    return {
      DbHelper.EXPENSE_ID: id ,
      DbHelper.TITLE: title,
      DbHelper.EXPENSE_DATE: date,
      DbHelper.AMOUNT: amount,
      DbHelper.DESC: desc,
      DbHelper.BALANCE: balance,
      DbHelper.EXPENSE_TYPE: type,
      DbHelper.CATAGORY_ID: catagory_id,

    };

  }




}