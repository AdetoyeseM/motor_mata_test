import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
get(
    {@required String? url, 
    BuildContext? context,
    bool? stopClose}) async {
  if (context != null) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (stopClose == null) {
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
  }

  var uri = Uri.parse(url!);
  print(uri);
  var result;
  var data;

  try {
    result = await http.get(uri).timeout(const Duration(seconds: 15));
    data = json.decode(result.body);
  } catch (err) {
    switch (err) {
      case SocketException:
        data = "Socket Exception";
        break;
      case TimeoutException:
        data = "Time Exception";
        break;
      default:
        data = err;
    }
  }

  return {"data": data, "status_code": result.statusCode};
}
