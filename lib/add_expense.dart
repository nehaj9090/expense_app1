
import 'package:expense_app1/screen/home/bloc/cat/cat_bloc.dart';
import 'package:expense_app1/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpensePage extends StatefulWidget {
  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CatBloc>(context).add(GetCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of( context);
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(21))),
              builder: (context) {
                return Container(
                  height: mq.size.height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: 50,
                                height: 50,
                              ),
                              hightSpacer(mhight: 17),
                              Text('Title')
                            ],
                          );
                        }),
                  ),
                );
              });
        },
        child: Text(
          'Chose Expense Type',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
