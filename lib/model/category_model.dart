

import '../db_helper.dart';

class CatModel{

  int? id;
  String? title;
  String? path;


  CatModel({this.id,this.title,this.path});


  factory CatModel.fromMap(Map<String, dynamic> map){

    return CatModel(
      id: map[DbHelper.CAT_ID],
      title: map[DbHelper.CAT_TITLE],
      path: map[DbHelper.CAT_IMG],
    );
  }

  Map<String, dynamic>toMap(){

    return {
      DbHelper.CAT_ID : id,
      DbHelper.CAT_TITLE : title,
      DbHelper.CAT_IMG : path,


    };

  }

}