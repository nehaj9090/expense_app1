
import 'package:expense_app1/provider/app_provider.dart';
import 'package:expense_app1/screen/home/bloc/cat/cat_bloc.dart';
import 'package:expense_app1/screen/home/bloc/expense/expense_bloc.dart';
import 'package:expense_app1/screen/home/repo/expense_repo.dart';
import 'package:expense_app1/screen/home/repo/home_page.dart';
import 'package:expense_app1/ui_helper.dart';
import 'package:expense_app1/user_onbord/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'db_helper.dart';

void main() {
  //bloc intigration in holl app///
  var expenseRepo = ExpenseRepo(dbHelper: DbHelper());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>AppProvider())
  ], child:  MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>ExpenseBloc(repo:expenseRepo)),
      BlocProvider(create: (_)=>CatBloc(repo: expenseRepo)),
    ],
    child: const MyApp() ,
  )
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (ctx,provider,child){
      return MaterialApp(
          color: Colors.cyan,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.darkTheme(),
          theme: AppTheme.lightTheme(),
          themeMode: provider.getThemeMode() ? ThemeMode.dark : ThemeMode.light ,
          home: LoginPage()
      );
    });
  }
}
