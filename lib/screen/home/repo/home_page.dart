
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../ui_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('home',style: TextStyle(color: AppColor.appBlackColor),),),
        body: Column(
          children: [
            Text('hello',style: mHeadLine43(),),
          ],
        )

    );
  }
}
