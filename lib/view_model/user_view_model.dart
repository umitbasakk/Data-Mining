

import 'package:flutter/material.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel  with ChangeNotifier{
  User? _user;
  User? get user => _user;
  Future<bool> saveUser(User user) async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('name', user.name!);
    sp.setString('username', user.username!);
    sp.setString('email', user.email!);
    sp.setString('phone', user.phone!);
    sp.setString('token', user.token!);
    sp.setString('created_at', user.created_at.toString()!);
    sp.setString('updated_at', user.updated_at.toString()!);

    notifyListeners();
    return true;
  }

   Future<User> getUser() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? name = sp.getString('name');
    final String? username = sp.getString('username');
    final String? email = sp.getString('email');
    final String? phone = sp.getString('phone');
    final String? token = sp.getString('token');
    final DateTime? created_at = DateTime.parse(sp.getString('created_at')!);
    final DateTime? updated_at = DateTime.parse(sp.getString('updated_at')!);
    if(token != 'null' || token != '' || token != null){
      _user = User(
                  name:name,
                  username: username,
                  email: email,
                  phone: phone,
                  token: token,
                  created_at: created_at,
                  updated_at: updated_at
                );
        notifyListeners();
    }
    return User(
      name:name,
      username: username,
      email: email,
      phone: phone,
      token: token,
      created_at: created_at,
      updated_at: updated_at
    );
  }

  Future<bool> Logout() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return sp.clear();
  }
}