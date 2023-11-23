
import '../db_helper.dart';

class UserModel{

  int? id;
  String? name;
  String? email;
  String?  pass;
  String? mob_no;
  String? img;


  UserModel({
    this.id,
    this.name,
    this.email,
    this.pass,
    this.mob_no,
    this.img

  });


  factory UserModel.fromMap(Map<String, dynamic>map){
    return UserModel(
      id: map[DbHelper.USER_ID],
      name: map[DbHelper.USER_NAME],
      email: map[DbHelper.USER_EMAIL],
      pass: map[DbHelper.USER_PASS],
      mob_no: map[DbHelper.USER_MOBILE_NO],
      img: map[DbHelper.USER_IMG],


    );
  }


  Map<String, dynamic>toMap(){
    return {
      DbHelper.USER_ID: id ,
      DbHelper.USER_NAME: name,
      DbHelper.USER_EMAIL: email,
      DbHelper.USER_PASS: pass,
      DbHelper.USER_MOBILE_NO: mob_no,
      DbHelper.USER_IMG: img,

    };

  }




}