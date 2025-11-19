
import 'package:coba_mvc/view/ref_jns_notif_form_view.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../controller/ref_jns_notif_controller.dart';

class RefJnsNotifListView extends StatefulWidget {
  @override
  _RefJnsNotifListViewState createState() => _RefJnsNotifListViewState();
}

class _RefJnsNotifListViewState extends StateMVC<RefJnsNotifListView> {
  late RefJnsNotifController con;

  _RefJnsNotifListViewState() : super(RefJnsNotifController()) {
    con = controller as RefJnsNotifController;
  }

  @override
  void initState() {
    super.initState();
    con.loadRefJnsNotifs();
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

    return Scaffold(
      appBar: AppBar(title: Text("CRUD")),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateAndRefresh(RefJnsNotifFormView()),
        child: Icon(Icons.add),
      ),

      body: con.isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: con.loadRefJnsNotifs,
              child: ListView.builder(
                itemCount: con.RefJnsNotifs.length,
                itemBuilder: (context, i) {
                  final p = con.RefJnsNotifs[i];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(p.kdJnsNotif?.toString() ?? "No ID"),

                        subtitle: Text("Ket: ${p.ket}"),
                            
                        
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
                              onPressed: () => con.removeRefJnsNotif(p.kdJnsNotif!),
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
