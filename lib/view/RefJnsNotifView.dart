import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controller/RefJnsNotifCtrl.dart';
import 'RefJnsNotifFormView.dart';

class RefJnsNotifView extends StatefulWidget {
  @override
  RefJnsNotifViewState createState() => RefJnsNotifViewState();
}

class RefJnsNotifViewState extends StateMVC<RefJnsNotifView> {
  late RefJnsNotifCtrl con;

  RefJnsNotifViewState() : super(RefJnsNotifCtrl()) {
    con = controller as RefJnsNotifCtrl;
  }

  @override
  void initState() {
    super.initState();

    con.context = context;

    Timer(const Duration(milliseconds: 100), () {
      con.initial();
    });
  }

  Future<void> _navigateAndRefresh(Widget page) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );

    if (result == true) {
      await con.loadRefJnsNotifs();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    con.view = this;

    return Scaffold(
      appBar: AppBar(title: Text("RefJnsNotif CRUD")),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateAndRefresh(RefJnsNotifFormView()),
        child: Icon(Icons.add),
      ),

      body: con.isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: con.loadRefJnsNotifs,
        child: ListView.builder(
          itemCount: con.refJnsNotifs.length,
          itemBuilder: (context, i) {
            final p = con.refJnsNotifs[i];

            return Column(
              children: [
                ListTile(
                  title: Text(
                    p.kdJnsNotif?.toString() ?? "No ID",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  subtitle: Text("Ket: ${p.ket ?? '-'}"),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _navigateAndRefresh(
                          RefJnsNotifFormView(refJnsNotif: p),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          bool ok = await con.removeRefJnsNotif(
                              p.kdJnsNotif ?? 0);

                          if (ok) setState(() {});
                        },
                      ),
                    ],
                  ),
                ),

                Divider(height: 1),
              ],
            );
          },
        ),
      ),
    );
  }
}
