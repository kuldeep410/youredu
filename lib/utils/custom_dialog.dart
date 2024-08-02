import 'package:flutter/material.dart';
import 'package:lms/utils/nav_utail.dart';

import '../screen/home/home_screen/home_screen.dart';

class CustomDialog{
 static Future<void> showMessage(
      context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget> [
                Text("Something went wrong",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okey'),
              onPressed: () {
                Navigator.of(context).pop();
                NavUtil.pushAndRemoveUntil(context, const HomeScreen());
              },
            ),
          ],
        );
      },
    );
  }
}