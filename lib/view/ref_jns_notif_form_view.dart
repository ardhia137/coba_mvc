import 'package:coba_mvc/controller/ref_jns_notif_controller.dart';
import 'package:coba_mvc/model/ref_jns_notif.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RefJnsNotifFormView extends StatefulWidget {
  final RefJnsNotif? refJnsNotif;

  const RefJnsNotifFormView({super.key, this.refJnsNotif});

  @override
  _RefJnsNotifFormViewState createState() => _RefJnsNotifFormViewState();

}
class _RefJnsNotifFormViewState extends StateMVC<RefJnsNotifFormView> {
  late RefJnsNotifController con;

  _RefJnsNotifFormViewState() : super(RefJnsNotifController()) {
    con = controller as RefJnsNotifController;
  }

  final _ketCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.refJnsNotif != null) {
      _ketCtrl.text = widget.refJnsNotif!.ket!;
     
    }
  }

  void _saveRefJnsNotif() async {
    final ket = _ketCtrl.text;

    bool success = false;

    if (widget.refJnsNotif == null) {
      success = await con.addRefJnsNotif(
        RefJnsNotif(kdJnsNotif: null, ket: ket),
      );
    } else {
      success = await con.editRefJnsNotif(
        RefJnsNotif(
          kdJnsNotif: widget.refJnsNotif!.kdJnsNotif,
          ket: ket,
        ),
      );
    }

    if (!mounted) return;

    if (success) {
      Navigator.pop(context, true); // Kembali ke list
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal menyimpan")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.refJnsNotif == null ? "Add RefJnsNotif" : "Edit RefJnsNotif")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _ketCtrl, decoration: InputDecoration(labelText: "Ket")),
           
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveRefJnsNotif, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
