

import 'dart:convert';

import 'constants.dart';
import 'package:http/http.dart' as http;


class API{
  Future<List> getData(
      String url) async {
    List<dynamic> data = <dynamic>[];
    Map? newData;



    try {
      await http.get(Uri.parse(url), ).then((
          response) async {

        if (response.statusCode == 200) {

          data = json.decode(response.body) as List;


        }

      });
    }
    catch (error) {
      // Ui.errorSnackBar("Error/ $url", error.toString());

    }
    return data;
  }

}