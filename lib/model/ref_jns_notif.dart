import 'package:json_annotation/json_annotation.dart';

part 'ref_jns_notif.g.dart';

@JsonSerializable()
class RefJnsNotif {
  @JsonKey(name: 'kdJnsNotif')
  int? kdJnsNotif;

  @JsonKey(name: 'ket')
  String? ket;

  RefJnsNotif({this.kdJnsNotif, this.ket});

  factory RefJnsNotif.fromJson(Map<String, dynamic> json) =>
      _$RefJnsNotifFromJson(json);

  Map<String, dynamic> toJson() => _$RefJnsNotifToJson(this);
}
