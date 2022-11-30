import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/src/intl/date_format.dart';
import 'package:timeago/timeago.dart' as timeago;



class Helpers {



  Future<MaterialColor> getMaterialColor(int r, int g, int b)async{
    Map<int, Color> colorCodes = {
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    };
// Green color code: FF93cd48
    MaterialColor customColor = MaterialColor(0xe58a7b, colorCodes);
    return customColor;
  }

  getTime(String s) {
    if (s == "null") {
      return 'not Valid';
    }
    var text="";
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(s).add(Duration(hours: 2));
    var dateLocal = dateTime.toLocal();
    final now = DateTime.now();
    final difference = now.difference(dateLocal);
    if(difference.inMinutes<-1 && difference.inMinutes>-59) {
      text= "${difference.inMinutes*-1} minuets ago";
    } else{
      text = timeago.format(
          now.subtract(difference),
          locale: 'en',
          allowFromNow: false
      );
    }

    return text;
  }



}
