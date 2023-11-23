
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ui_helper.dart';

class BottomOnBoardStack extends StatelessWidget {

  VoidCallback onpress;
  String title;
  String subtitle;

  BottomOnBoardStack({
    required this.onpress,
    this.title = 'Don/t have an account',
    this.subtitle = 'Sign - up now'


  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.fill,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        widthSpacer(),
        InkWell(
            onTap: onpress,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                subtitle,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}
