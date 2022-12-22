// ignore_for_file: avoid_print

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_flutter/semester/models/semestermodel.dart';
import 'package:mvvm_flutter/utils/constants.dart';

import 'apistatus.dart';

class SemesterService {
  static Future<Object> getSemesters() async {
    try {
      var response = await http.get(Uri.parse(SEMESTER_LIST));
      if (SUCCESS == response.statusCode) {
        print("Success");
        return Success(
            response: semesterModelFromJson(response.body), code: SUCCESS);
      } else {
        print("Invalid Response");
        return Failure(
            code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
      }
    } on HttpException {
      print("No Internet Connection 1");
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      print("No Internet Connection 2");

      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      print("Invalid Format");

      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      print("Unknown Error");

      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
