import 'package:json_annotation/json_annotation.dart';

part 'OrderModel.g.dart';

@JsonSerializable()
class OrderModel {
  @JsonKey(name: "_id")
  String id;
  String username;
  String date;
  String customer_name;
  String customer_contact_number;
  String start_time;
  String end_time;
  String Total;
  String total_time;
  List<String> cart;



  OrderModel(
      {
        this.id,
        this.username,
        this.date,
        this.end_time,
        this.start_time,
        this.Total,
        this.total_time,
        this.cart,
        this.customer_name,
        this.customer_contact_number,
      });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}