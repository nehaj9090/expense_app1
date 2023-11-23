import 'dart:js';


import 'package:expense_app1/user_onbord/login/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_logo/app_logo_stack.dart';
import '../../bottom_onbord_stack_widget.dart';
import '../../custom_widget/rouned_btn_widget.dart';
import '../../provider/app_provider.dart';
import '../../ui_helper.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();

  var passController = TextEditingController();

  late MediaQueryData mq;

  bool check = false;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context);

    ///check  height///
    // print(mq.size.height);//

    return Scaffold(
      body: mq.orientation == Orientation.portrait
          ? _portraitLay(context)
          : _lanscapeLay(context),
    );
  }

  Widget _mainLay(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mq.size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLogoWidget(
            mq: mq,
            iconColor: Colors.black,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('Hello again',
                style: mq.size.width > 800
                    ? Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Colors.blueGrey)
                    : Theme.of(context).textTheme.titleLarge),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'start managing your expense in one click',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          hightSpacer(mhight: mq.size.height * 0.01),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: feildDecoration(
                  hint: 'Enter your Email',
                  labelText: 'Email',
                  prefixIcon: Icons.email_outlined),
            ),
          ),
          hightSpacer(mhight: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passController,
              decoration: feildDecoration(
                  hint: 'Enter your Password',
                  labelText: 'password ',
                  prefixIcon: Icons.password,
                  ispasswordField: true),
            ),
          ),
          hightSpacer(mhight: 20),
          RounededBtn(
            title: 'Login',
            onpress: () {},
            mIcon: Icons.login,
          ),
          hightSpacer(mhight: 25),
          BottomOnBoardStack(
            onpress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupPage()));
            },
          ),
          Switch(
              value: check,
              onChanged: (value) {
                check = value;
                Provider.of<AppProvider>(context, listen: false)
                    .changeTheme(value);
                setState(() {});
              })
        ],
      ),
    );
  }

  Widget _portraitLay(BuildContext context) {
    return mq.size.height > 650
        ? _mainLay(context)
        : SingleChildScrollView(
      child: _mainLay(context),
    );
  }

  Widget _lanscapeLay(BuildContext context) {
    {
      return Row(
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppLogoWidget(
                    mq: mq,

                    iconColor: AppColor.appBlackColor,
                  ),
                  Text('Expenser', style: Theme.of(context).textTheme.displayLarge)
                ],
              )),
          Expanded(
              child: mq.size.height > 650
                  ? _mainLay(context)
                  : SingleChildScrollView(
                child: _mainLay(context),
              )),
        ],
      );
    }
  }
}
