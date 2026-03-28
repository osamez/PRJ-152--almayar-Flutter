// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoxModel _$BoxModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  'BoxModel',
  json,
  ($checkedConvert) {
    final val = BoxModel(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      code: $checkedConvert('code', (v) => v as String?),
      shipmentCode: $checkedConvert('shipment_code', (v) => v as String?),
      receivingBranch: $checkedConvert('receiving_branch', (v) => v as String?),
      tripCode: $checkedConvert('trip_code', (v) => v as String?),
      weight: $checkedConvert(
        'weight',
        (v) => const NullableStringConverter().fromJson(v),
      ),
      dimensions: $checkedConvert(
        'dimensions',
        (v) => v == null
            ? null
            : DimensionsModel.fromJson(v as Map<String, dynamic>),
      ),
      size: $checkedConvert(
        'size',
        (v) => const NullableStringConverter().fromJson(v),
      ),
      price: $checkedConvert(
        'price',
        (v) => const NullableStringConverter().fromJson(v),
      ),
      priceAfterDiscount: $checkedConvert(
        'price_after_discount',
        (v) => const NullableStringConverter().fromJson(v),
      ),
      status: $checkedConvert(
        'status',
        (v) =>
            v == null ? null : StatusModel.fromJson(v as Map<String, dynamic>),
      ),
      financialStatus: $checkedConvert(
        'financial_status',
        (v) =>
            v == null ? null : StatusModel.fromJson(v as Map<String, dynamic>),
      ),
      deliveryDate: $checkedConvert('delivery_date', (v) => v as String?),
      discountValue: $checkedConvert(
        'discount_value',
        (v) => const NullableStringConverter().fromJson(v),
      ),
      boxImage: $checkedConvert(
        'box_image',
        (v) => const NullableStringConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'shipmentCode': 'shipment_code',
    'receivingBranch': 'receiving_branch',
    'tripCode': 'trip_code',
    'priceAfterDiscount': 'price_after_discount',
    'financialStatus': 'financial_status',
    'deliveryDate': 'delivery_date',
    'discountValue': 'discount_value',
    'boxImage': 'box_image',
  },
);

Map<String, dynamic> _$BoxModelToJson(BoxModel instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'shipment_code': instance.shipmentCode,
  'receiving_branch': instance.receivingBranch,
  'trip_code': instance.tripCode,
  'weight': const NullableStringConverter().toJson(instance.weight),
  'dimensions': instance.dimensions,
  'size': const NullableStringConverter().toJson(instance.size),
  'price': const NullableStringConverter().toJson(instance.price),
  'price_after_discount': const NullableStringConverter().toJson(
    instance.priceAfterDiscount,
  ),
  'status': instance.status,
  'financial_status': instance.financialStatus,
  'delivery_date': instance.deliveryDate,
  'discount_value': const NullableStringConverter().toJson(
    instance.discountValue,
  ),
  'box_image': const NullableStringConverter().toJson(instance.boxImage),
};
