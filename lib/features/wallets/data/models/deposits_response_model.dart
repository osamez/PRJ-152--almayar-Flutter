import 'package:json_annotation/json_annotation.dart';
import '../../../../core/models/meta_model.dart';
import 'deposit_model.dart';

part 'deposits_response_model.g.dart';

@JsonSerializable()
class DepositsResponseModel {
  final List<DepositModel>? deposits;
  final MetaModel? meta;

  const DepositsResponseModel({
    this.deposits,
    this.meta,
  });

  factory DepositsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DepositsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepositsResponseModelToJson(this);
}
