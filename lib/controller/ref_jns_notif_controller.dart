import 'package:mvc_pattern/mvc_pattern.dart';
import '../services/api_services.dart';
import '../model/ref_jns_notif.dart';

class RefJnsNotifController extends ControllerMVC {
  RefJnsNotifController();

  final ApiService api = ApiService();

  List<RefJnsNotif> RefJnsNotifs = [];
  bool isLoading = true;

  Future<void> loadRefJnsNotifs() async {
    setState(() => isLoading = true);
    try {
      RefJnsNotifs = await api.fetchRefJnsNotifs();
      
    } catch (e) {
      print(e); 
    }
    setState(() => isLoading = false);
  }

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

  Future<bool> removeRefJnsNotif(int KdJnsNotif) async {
    try {
      await api.deleteRefJnsNotif(KdJnsNotif);
      RefJnsNotifs.removeWhere((prod) => prod.kdJnsNotif == KdJnsNotif);
      setState(() {}); 
      return true;
    } catch (e) {
      return false;
    }
  }
}