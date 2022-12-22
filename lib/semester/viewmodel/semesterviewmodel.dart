// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/semester/models/semestererror.dart';
import 'package:mvvm_flutter/semester/models/semestermodel.dart';
import 'package:mvvm_flutter/semester/services/semesterservice.dart';

import '../services/apistatus.dart';

class SemesterViewModel extends ChangeNotifier {
  SemesterViewModel() {
    getSemesters();
  }

  bool _loading = false;
  List<SemesterModel> _semesterListModel = [];
  SemesterError _semesterError = SemesterError();
  final SemesterModel _addingUser = SemesterModel();

  bool get loading => _loading;
  List<SemesterModel> get semesterListModel => _semesterListModel;
  SemesterError get userError => _semesterError!;
  SemesterModel get addingUser => _addingUser;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setSemesterListModel(List<SemesterModel> semesterListModel) {
    _semesterListModel = semesterListModel;
  }

  setSemesterError(SemesterError semesterError) {
    _semesterError = semesterError;
  }

  getSemesters() async {
    setLoading(true);
    var response = await SemesterService.getSemesters();
    if (response is Success) {
      setSemesterListModel(response.response as List<SemesterModel>);
    }
    if (response is Failure) {
      SemesterError semesterError = SemesterError(
        isError: true,
        code: response.code,
        message: response.errorResponse,
      );
      print(semesterError.code);
      print(semesterError.message);
      print(semesterError.isError);
      setSemesterError(semesterError);
    }
    setLoading(false);
  }
}
