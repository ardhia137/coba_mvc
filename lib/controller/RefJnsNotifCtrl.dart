import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';

import '../services/api_services.dart';
import '../model/RefJnsNotif.dart';
import '../view/RefJnsNotifView.dart';

class RefJnsNotifCtrl extends ControllerMVC {
  late RefJnsNotifViewState _view;
  late BuildContext context;

  final ApiService api = ApiService();

  List<RefJnsNotif> refJnsNotifs = [];
  bool isLoading = true;

  set view(RefJnsNotifViewState value) {
    _view = value;
    context = _view.context;
  }

  void initial() {
    loadRefJnsNotifs();
  }

  Future<void> loadRefJnsNotifs() async {
    isLoading = true;
    _view.setState(() {});
    try {
      refJnsNotifs = await api.fetchRefJnsNotifs();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    _view.setState(() {});
  }

  Future<bool> removeRefJnsNotif(int kdJnsNotif) async {
    try {
      await api.deleteRefJnsNotif(kdJnsNotif);
      refJnsNotifs.removeWhere((prod) => prod.kdJnsNotif == kdJnsNotif);
      _view.setState(() {});
      return true;
    } catch (e) {
      return false;
    }
  }
}
