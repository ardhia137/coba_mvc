import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/RefJnsNotif.dart';

class ApiService {
  final String baseUrl = 'http://172.120.40.160:8080/rest-api-tomcat/api/ref-notif';

 Future<List<RefJnsNotif>> fetchRefJnsNotifs() async {
   final res = await http.get(Uri.parse(baseUrl));
   final Map<String, dynamic> json = jsonDecode(res.body);
   final List data = json['data'];
   return data.map((e) => RefJnsNotif.fromJson(e)).toList();
  }
  Future<RefJnsNotif> createRefJnsNotif(RefJnsNotif p) async {
    final res = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(p.toJson()),
    );
    return RefJnsNotif.fromJson(jsonDecode(res.body));
  }

  Future<RefJnsNotif> updateRefJnsNotif(RefJnsNotif p) async {
    final res = await http.put(
      Uri.parse('$baseUrl/${p.kdJnsNotif}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(p.toJson()),
    );
    return RefJnsNotif.fromJson(jsonDecode(res.body));
  }
  Future<void> deleteRefJnsNotif(int id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}