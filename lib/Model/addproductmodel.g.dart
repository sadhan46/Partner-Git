// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addproductmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Addproductmodel _$AddproductmodelFromJson(Map<String, dynamic> json) {
  return Addproductmodel(
    username: json['username'] as String,
    product_name: json['product_name'] as String,
    product_details: json['product_details'] as String,
    productImage:
        (json['productImage'] as List)?.map((e) => e as String)?.toList(),
    currency: json['currency'] as String,
    quantity: json['quantity'] as String,
    unit: json['unit'] as String,
    id: json['_id'] as String,
    mrp: json['mrp'] as String,
    sp: json['sp'] as String,
    per: json['per'] as String,
    counter: json['counter'] as int,
    addProduct: json['addProduct'] as bool,
  );
}

Map<String, dynamic> _$AddproductmodelToJson(Addproductmodel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'product_name': instance.product_name,
      'product_details': instance.product_details,
      'productImage': instance.productImage,
      'quantity': instance.quantity,
      'currency': instance.currency,
      'unit': instance.unit,
      '_id': instance.id,
      'mrp': instance.mrp,
      'sp': instance.sp,
      'per': instance.per,
      'counter': instance.counter,
      'addProduct': instance.addProduct,
    };
