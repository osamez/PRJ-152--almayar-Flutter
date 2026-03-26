import 'package:almeyar/core/models/meta_model.dart';
import 'package:almeyar/features/home/data/models/branch_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branches_response_model.g.dart';

@JsonSerializable()
class BranchesResponseModel {
  final List<BranchModel>? branches;
  final MetaModel? meta;

  const BranchesResponseModel({
    this.branches,
    this.meta,
  });

  factory BranchesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BranchesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchesResponseModelToJson(this);
}
