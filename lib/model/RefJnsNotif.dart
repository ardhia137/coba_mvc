import 'package:json_annotation/json_annotation.dart';

part 'RefJnsNotif.g.dart';

@JsonSerializable(nullable: true)
class RefJnsNotif {
  int? kdJnsNotif;
  String? ket;

  RefJnsNotif({
    this.kdJnsNotif,
    this.ket,
  });

  factory RefJnsNotif.fromJson(Map<String, dynamic> json) =>
      _$RefJnsNotifFromJson(json);

  Map<String, dynamic> toJson() => _$RefJnsNotifToJson(this);
}
