import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<bool> login(String usuario, String password) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'usuarios',
      where: 'usuario = ? AND password = ?',
      whereArgs: [usuario, password],
    );

    if (result.isNotEmpty) {
      _isAuthenticated = true;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}