import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import 'package:bmi_calculator/src/core/helpers/db_names_helper.dart';

import 'package:bmi_calculator/src/database/db.dart';

import 'package:bmi_calculator/src/models/bmi_data_model.dart';

class BmiDataRepository extends ChangeNotifier {
  late Database _db;

  final ValueNotifier<List<BmiDataModel>> bmiDatasValueNotifier =
      ValueNotifier<List<BmiDataModel>>([]);

  List<BmiDataModel> get bmiDatas => bmiDatasValueNotifier.value;

  Future<void> getData() async {
    _db = await DB.instance.database;
    final List<Map<String, dynamic>> result = await _db.query(
      DBNamesHelper.bmiData,
    );
    bmiDatasValueNotifier.value = result.map((value) {
      return BmiDataModel.fromMap(value);
    }).toList();
    notifyListeners();
  }

  Future<void> addData(BmiDataModel bmiData) async {
    _db = await DB.instance.database;
    await _db.insert(
      DBNamesHelper.bmiData,
      bmiData.toMap(),
    );
    await getData();
  }

  Future<void> removeData(int id) async {
    _db = await DB.instance.database;
    await _db.delete(
      DBNamesHelper.bmiData,
      where: 'id = ?',
      whereArgs: [id],
    );
    await getData();
  }

  Future<void> deleteAllData() async {
    _db = await DB.instance.database;
    await _db.delete(DBNamesHelper.bmiData);
    bmiDatasValueNotifier.value = [];
    notifyListeners();
  }
}
