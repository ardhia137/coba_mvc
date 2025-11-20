import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controller/RefJnsNotifFormCtrl.dart';
import '../model/RefJnsNotif.dart';

class RefJnsNotifFormView extends StatefulWidget {
  final RefJnsNotif? refJnsNotif;
  const RefJnsNotifFormView({super.key, this.refJnsNotif});
  @override
  RefJnsNotifFormViewState createState() => RefJnsNotifFormViewState();
}

class RefJnsNotifFormViewState extends StateMVC<RefJnsNotifFormView> {
  late RefJnsNotifFormCtrl con;

  RefJnsNotifFormViewState() : super(RefJnsNotifFormCtrl()) {
    this.con = controller as RefJnsNotifFormCtrl;
  }

  final ketCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    con.context = context;
    if (widget.refJnsNotif != null) {
      ketCtrl.text = widget.refJnsNotif!.ket ?? "";
    }
    Timer(const Duration(milliseconds: 100), () {
      con.view = this;
      con.initial();
    });
  }

  @override
  Widget build(BuildContext context) {
    con.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.refJnsNotif == null
            ? "Add RefJnsNotif"
            : "Edit RefJnsNotif"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: ketCtrl,
              decoration: InputDecoration(labelText: "Ket"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => con.save(),
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

}

