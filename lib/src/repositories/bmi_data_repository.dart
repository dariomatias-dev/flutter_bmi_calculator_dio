import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import 'package:bmi_calculator/src/core/helpers/db_names_helper.dart';

import 'package:bmi_calculator/src/database/db.dart';

import 'package:bmi_calculator/src/models/bmi_data_model.dart';

class BmiDataRepository extends ChangeNotifier {
  late Database _db;
  List<BmiDataModel> _bmiData = [];

  List<BmiDataModel> get bmiData => _bmiData;

  BmiDataRepository() {
    _initRepository();
  }

  _initRepository() async {
    await getBmiData();
  }

  Future<void> getBmiData() async {
    _db = await DB.instance.database;
    final List<Map<String, dynamic>> result = await _db.query(
      DBNamesHelper.bmiData,
    );
    _bmiData = result.map((value) {
      return BmiDataModel.fromMap(value);
    }).toList();
  }

  Future<void> addBmiData(BmiDataModel bmiData) async {
    _db = await DB.instance.database;
    await _db.insert(
      DBNamesHelper.bmiData,
      bmiData.toMap(),
    );
    notifyListeners();
  }

  Future<void> removeBmiData(String id) async {
    _db = await DB.instance.database;
    await _db.delete(
      DBNamesHelper.bmiData,
      where: 'id = ?',
      whereArgs: [id],
    );
    notifyListeners();
  }
}
