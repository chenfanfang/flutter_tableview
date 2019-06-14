import 'package:flutter/material.dart';

typedef PopCallback = Function(dynamic value);

Future<dynamic> push(BuildContext context, Widget page, {String routeName, PopCallback popCallBack}) {

  MaterialPageRoute route = MaterialPageRoute(builder: (BuildContext context){

    return page;
  });
  return Navigator.of(context).push(route).then((onValue){

    if(popCallBack != null) {

      popCallBack(onValue);
    }
  });
}

void pop(BuildContext context, {var callBackValue}) {

  if(callBackValue != null) {
    Navigator.of(context).pop(callBackValue);
  }
  else {
    Navigator.of(context).pop();
  }
}

void popToPage(BuildContext context, String pageClassName) {
  Navigator.of(context).popUntil(ModalRoute.withName(pageClassName));
}