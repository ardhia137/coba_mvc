

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
  
  void save() async {
    String ket = _view.ketCtrl.text;

    RefJnsNotif refJnsNotif = RefJnsNotif(
      ket: ket,
    );

    bool success;
    if (_view.widget.refJnsNotif == null) {
      success = await addRefJnsNotif(refJnsNotif);
    } else {
      refJnsNotif.kdJnsNotif = _view.widget.refJnsNotif!.kdJnsNotif;
      success = await editRefJnsNotif(refJnsNotif);
    }

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('RefJnsNotif saved successfully')),
      );
      Navigator.of(context).pop(true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save RefJnsNotif')),
      );
    }
  }
}
