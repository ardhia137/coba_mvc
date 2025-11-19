

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';
import '../services/api_services.dart';
import 'package:coba_mvc/view/RefJnsNotifFormView.dart';
import 'package:coba_mvc/model/RefJnsNotif.dart';

class RefJnsNotifFormCtrl extends ControllerMVC {
  late RefJnsNotifFormViewState _view;
  late BuildContext context;
  final ApiService api = ApiService();
  set view(RefJnsNotifFormViewState value) {
    _view = value;
  }

  void initial() {}


  Future<bool> addRefJnsNotif(RefJnsNotif p) async {
    try {
      await api.createRefJnsNotif(p);
      return true;
    } catch (e) {
      return false;
    }
  }
  Future<bool> editRefJnsNotif(RefJnsNotif p) async {
    try {
      await api.updateRefJnsNotif(p);
      return true;
    } catch (e) {
      return false;
    }
  }
}
